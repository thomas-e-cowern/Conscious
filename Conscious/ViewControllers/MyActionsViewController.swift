//
//  MyActionsViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/18/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class MyActionsViewController: UIViewController{

    @IBOutlet weak var myActionsTableview: UITableView!
    @IBOutlet weak var actionsCompleteLabel: UILabel!
    @IBOutlet weak var actionsPledged: UILabel!
    @IBOutlet weak var carbonSavedLabel: UILabel!
    
    var myActions: [ActionPlanDetail]  = []
    var actionsCompleted: [ActionPlanDetail]  = []
    var totalCarbonSavings: Double = 0
    var actionsCompletedCount: Int = 0
    var savedActions: [ActionPlanDetail] = []
    var intialCount: Int = 0
    
    fileprivate func setUpCarbonReduction(int: Int) {
        for i in 0..<int - 1 {
            totalCarbonSavings += actionsCompleted[i].carbonReduction ?? 0
            print("Tcc: \(totalCarbonSavings)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        intialCount = 0
        let loadedActions: [ActionPlanDetail] = LocalStorageController.shared.loadFromPersistenceStore(path: "action")
        self.savedActions = loadedActions
        print("👠👠👠👠👠👠👠👠\(savedActions[0].completed)👠👠👠👠👠👠👠👠👠👠👠")
        myActions = savedActions
        print("🥼🥼🥼🥼🥼🥼🥼🥼🥼🥼\(myActions)🥼🥼🥼🥼🥼🥼🥼🥼🥼🥼")
        myActionsTableview.dataSource = self
        actionsCompletedCount = myActions.filter { $0.completed == true }.count
        print("Acc: \(actionsCompletedCount)")
        setUpCarbonReduction(int: actionsCompletedCount)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myActions = savedActions
        updateViews()
    }
    
    func updateViews() {
        myActions = savedActions
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
        cell.tag = indexPath.row
        cell.action = myActions[indexPath.row]
        let testTitle = myActions[indexPath.row].action
        let attributedString = NSMutableAttributedString(string: testTitle)
        cell.actionViewCellLabel.text = myActions[indexPath.row].action
        switch myActions[indexPath.row].icon {
        case "Food":
            cell.actionTableViewImage.image = UIImage(named: "FoodUnchecked")
        case "house":
            cell.actionTableViewImage.image = UIImage(named: "HomeUnchecked")
        default:
            cell.actionTableViewImage.image = UIImage(named: "TravelUnchecked")
        }
        if myActions[indexPath.row].completed == true {
            switch myActions[indexPath.row].icon {
            case "Food":
                cell.actionTableViewImage.image = UIImage(named: "FoodChecked")
            case "house":
                cell.actionTableViewImage.image = UIImage(named: "HomeChecked")
            default:
                cell.actionTableViewImage.image = UIImage(named: "TravelChecked")
            }
            attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: attributedString.length))
            cell.actionViewCellLabel.attributedText = attributedString
        } else {
            attributedString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSRange(location: 0, length: attributedString.length))
            cell.actionViewCellLabel.attributedText = attributedString
        }
        cell.delegate = self
        return cell
    }
}

extension MyActionsViewController: ActionTableViewCellDelegate {

    func actionChecked(for cell: ActionTableViewCell){
        guard let action = cell.action else { return }
        myActions[cell.tag].completed = true
        LocalStorageController.shared.saveActions(actions: myActions)
        actionsCompletedCount += 1
        let carbonReduction = (action.carbonReduction ?? 0)
        totalCarbonSavings += carbonReduction
        updateViews()
    }
    
    func actionUnchecked(for cell: ActionTableViewCell){
        guard let action = cell.action else { return }
        myActions[cell.tag].completed = false
        LocalStorageController.shared.saveActions(actions: myActions)
        actionsCompletedCount -= 1
        let carbonReduction = (action.carbonReduction ?? 0)
        totalCarbonSavings -= carbonReduction
        updateViews()
    }
}
