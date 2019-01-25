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
//    var actionsCompleted: Int = 0 {
//        didSet {
//            actionsCompleteLabel.text = "\(actionsCompleted)"
//        }
//    }
    var reductionInCo2: Double = 0 {
        didSet {
//            String(format: "%.2f", totalScore)
            let totalCarbon = String(format: "%.2f", reductionInCo2/52)
            carbonSavedLabel.text = totalCarbon + " lbs of CO2e lbs saved!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myActionsTableview.dataSource = self
        updateViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    func updateViews() {
        myActions = ActionPlanController.shared.userActionList
        actionsPledged.text = " / \(myActions.count)"
        carbonSavedLabel.text = "0 lbs of CO2e lbs saved!"
        myActionsTableview.reloadData()
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension MyActionsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myActions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myActionsCell", for: indexPath) as! ActionTableViewCell
        let action = myActions[indexPath.row]
        cell.actionViewCellLabel.text = action.action
        cell.co2Amount = action.carbonReduction
        cell.delegate = self
        return cell
    }
}

extension MyActionsViewController: ActionTableViewCellDelegate{
    func co2ReductionAdded(for cell: ActionTableViewCell, co2: Double) {
        reductionInCo2 += co2
    }
    
    func co2ReductionRemoved(for cell: ActionTableViewCell, co2: Double) {
        reductionInCo2 -= co2
    }
 
    func actionChecked(for cell: ActionTableViewCell){
        actionsCompleted = myActions.filter{ $0.completed == true }
    }
    
    func actionUnchecked(for cell: ActionTableViewCell){
//        actionsCompleted -= 1
    }
}
