//
//  MyActionsViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/18/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit
import UserNotifications

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
    
    fileprivate func updateCarbonSaved() {
        for i in 0..<actionsCompletedCount {
            if actionsCompletedCount == 0 {
                print("i is zero")
            } else {
                totalCarbonSavings += actionsCompleted[i].carbonReduction ?? 0
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.willEnterForegroundNotification
        let loadedActions: [ActionPlanDetail] = ActionPlanController.shared.loadFromPersistenceStore(path: "action")
        self.savedActions = loadedActions
        //        print("👠👠👠👠👠👠👠👠\(savedActions[0].completed)👠👠👠👠👠👠👠👠👠👠👠")
        myActions = savedActions
        print("🥼🥼🥼🥼🥼🥼🥼🥼🥼🥼\(myActions)🥼🥼🥼🥼🥼🥼🥼🥼🥼🥼")
        myActionsTableview.dataSource = self
        actionsPledged.text = " of \(myActions.count)"
        actionsCompleted = myActions.filter { $0.completed == true }
        actionsCompletedCount = actionsCompleted.count
        print("Acc: \(actionsCompletedCount)")
        updateCarbonSaved()
        print("TCS: \(totalCarbonSavings)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        myActions = ActionPlanController.shared.loadFromPersistenceStore(path: "action")
        updateViews()
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        let now = Date()
        print("N: \(now)")
        let date = dateFormatter.string(from: now)
        print("D: \(date)")
        let weekday = getDayOfWeek(date)
        print("WD: \(weekday)")
        if weekday == 1 {
            print("Holy cow it's Sunday, time to reset the task list")
            for i in 0..<myActions.count {
                myActions[i].completed = false
            }
            ActionPlanController.shared.saveToPersistentStoreData(path: "action")
        }
    }
    
    func updateViews() {
        myActions = ActionPlanController.shared.loadFromPersistenceStore(path: "action")
        actionsCompleteLabel.text = "\(actionsCompletedCount)"
        actionsPledged.text = " of \(myActions.count)"
        let carbonSavingString = String(format: "%.2f", totalCarbonSavings/52)
        carbonSavedLabel.text = "\(carbonSavingString) lbs of CO2e lbs saved!"
        myActionsTableview.reloadData()
    }
    
    func getDayOfWeek(_ today:String) -> Int? {
        let formatter  = DateFormatter()
        formatter.dateFormat = "MMM/dd/yyyy"
        guard let todayDate = formatter.date(from: today) else { return nil }
        let myCalendar = Calendar(identifier: .gregorian)
        let weekDay = myCalendar.component(.weekday, from: todayDate)
        return weekDay
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
            switch myActions[indexPath.row].icon {
            case "Food":
                cell.actionTableViewImage.image = UIImage(named: "FoodUnchecked")
            case "house":
                cell.actionTableViewImage.image = UIImage(named: "HomeUnchecked")
            default:
                cell.actionTableViewImage.image = UIImage(named: "TravelUnchecked")
            }
            attributedString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSRange(location: 0, length: attributedString.length))
            cell.actionViewCellLabel.attributedText = attributedString
        }
        cell.delegate = self
        return cell
    }
    
    fileprivate func deleteActionItem(_ indexPath: IndexPath, _ tableView: UITableView) {
        
        if totalCarbonSavings > 0 {
            totalCarbonSavings -= myActions[indexPath.row].carbonReduction ?? 0
        }
        myActions.remove(at: indexPath.row)
        ActionPlanController.shared.deleteAction(index: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        if actionsCompletedCount > 0 {
            actionsCompletedCount -= 1
        }
        updateViews()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("IP: \(indexPath.row)")
            deleteActionItem(indexPath, tableView)
        }
    }
}

extension MyActionsViewController: ActionTableViewCellDelegate {
    
    func actionChecked(for cell: ActionTableViewCell){
        guard let action = cell.action else { return }
        myActions[cell.tag].completed = true
        ActionPlanController.shared.saveActions(actions: myActions)
        actionsCompletedCount += 1
        let carbonReduction = (action.carbonReduction ?? 0)
        totalCarbonSavings += carbonReduction
        updateViews()
    }
    
    func actionUnchecked(for cell: ActionTableViewCell){
        guard let action = cell.action else { return }
        myActions[cell.tag].completed = false
        ActionPlanController.shared.saveActions(actions: myActions)
        actionsCompletedCount -= 1
        let carbonReduction = (action.carbonReduction ?? 0)
        totalCarbonSavings -= carbonReduction
        updateViews()
    }
}
