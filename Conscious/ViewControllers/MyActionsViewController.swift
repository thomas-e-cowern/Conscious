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
    
    var myActions: [String]  = []
    
    var actionsAvailable: Int = 0
    var actionsCompleted: Int = 0 {
        didSet {
            actionsCompleteLabel.text = "\(actionsCompleted)"
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
        actionsAvailable = myActions.count
        actionsPledged.text = " / \(actionsAvailable)"
        carbonSavedLabel.text = "\(ActionPlanController.shared.reductionInCo2)lbs of CO2e lbs saved!"
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
        cell.actionViewCellLabel.text = action
        cell.delegate = self
        return cell
    }
}

extension MyActionsViewController: ActionTableViewCellDelegate{
    func actionChecked(for cell: ActionTableViewCell){
        actionsCompleted += 1
    }
    
    func actionUnchecked(for cell: ActionTableViewCell){
        actionsCompleted -= 1
    }
}
