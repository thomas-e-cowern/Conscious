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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myActionsTableview.dataSource = self
        actionsCompleted = ActionPlanController.shared.userActionList.filter{ $0.completed == true }
        updateViews()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        actionsCompleted = ActionPlanController.shared.userActionList.filter{ $0.completed == true }
        updateViews()
    }
    
    func updateViews() {
        myActions = ActionPlanController.shared.userActionList
        actionsCompleted = ActionPlanController.shared.userActionList.filter{ $0.completed == true }
        actionsPledged.text = " of \(myActions.count)"
        carbonSavedLabel.text = "\(actionsCompleted.count) lbs of CO2e lbs saved!"
        myActionsTableview.reloadData()
    }
}

extension MyActionsViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("myActions.count: \(myActions.count)")
        return myActions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myActionsCell", for: indexPath) as! ActionTableViewCell
        let action = myActions[indexPath.row]
        cell.actionViewCellLabel.text = action.action
        cell.delegate = self
        return cell
    }
}

extension MyActionsViewController: ActionTableViewCellDelegate{
    func actionChecked(for cell: ActionTableViewCell){
        
    }
    
    func actionUnchecked(for cell: ActionTableViewCell){

    }
}
