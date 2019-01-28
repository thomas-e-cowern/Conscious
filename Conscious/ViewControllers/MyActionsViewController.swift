//
//  MyActionsViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/18/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class MyActionsViewController: UIViewController {
    
    @IBOutlet weak var myActionsTableview: UITableView!
    @IBOutlet weak var actionsCompleteLabel: UILabel!
    @IBOutlet weak var actionsPledged: UILabel!
    @IBOutlet weak var carbonSavedLabel: UILabel!
    
    var myActions: [ActionPlanDetail]  = []
    var actionsCompleted: [ActionPlanDetail]  = []
    var totalCarbonSavings: Double = 0
    var actionsCompletedCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let savedData = LocalStorageController.shared.loadFromPersistenceStore().last else { return }
        print("👠👠👠👠👠👠👠👠\(savedData)👠👠👠👠👠👠👠👠👠👠👠")
        myActions = savedData.actionPlan ?? []
        print("🥼🥼🥼🥼🥼🥼🥼🥼🥼🥼\(myActions)🥼🥼🥼🥼🥼🥼🥼🥼🥼🥼")
        myActionsTableview.dataSource = self
        
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    func updateViews() {
        myActions = ActionPlanController.shared.userActionList
        actionsCompleteLabel.text = "\(actionsCompletedCount)"
        actionsPledged.text = " of \(myActions.count)"
        let carbonSavingString = String(format: "%.2f", totalCarbonSavings/52)
        carbonSavedLabel.text = "\(carbonSavingString) lbs of CO2e lbs saved!"
        myActionsTableview.reloadData()
    }
}

extension MyActionsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myActions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myActionsCell", for: indexPath) as! ActionTableViewCell
        cell.action = myActions[indexPath.row]
        cell.actionViewCellLabel.text = myActions[indexPath.row].action
        cell.delegate = self
        return cell
    }
}

extension MyActionsViewController: ActionTableViewCellDelegate{
    func actionChecked(for cell: ActionTableViewCell){
        guard let action = cell.action else { return }
        cell.action?.completed = true
        actionsCompleted = myActions.filter{ $0.completed == true }
        actionsCompletedCount += 1
        let carbonReduction = (action.carbonReduction ?? 0)
        totalCarbonSavings += carbonReduction
        actionsCompleted.append(action)
        updateViews()
    }
    
    func actionUnchecked(for cell: ActionTableViewCell){
        guard let action = cell.action else { return }
        cell.action?.completed = false
        actionsCompleted = myActions.filter{ $0.completed == true }
        actionsCompletedCount -= 1
        let carbonReduction = (action.carbonReduction ?? 0)
        totalCarbonSavings -= carbonReduction
        updateViews()
    }
}
