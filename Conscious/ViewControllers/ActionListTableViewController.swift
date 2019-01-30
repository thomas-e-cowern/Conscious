//
//  ActionListTableViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/18/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ActionListTableViewController: UITableViewController {

    // MARK: - Properties
    var category: String = ""
    var foodActions: [ActionPlanDetail] = ActionPlanController.shared.foodActions
    var homeActions: [ActionPlanDetail] = ActionPlanController.shared.homeActions
    var travelActions: [ActionPlanDetail] = ActionPlanController.shared.travelActions
    var actions: [ActionPlanDetail] = []
//    var pulledAction: [String] = []
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    // MARK: - Actions
    @IBAction func allButtonTapped(_ sender: Any) {
        actions = []
        setUpView()
        updateViews()
    }
    @IBAction func foodButtonTapped(_ sender: Any) {
        category = "food"
        actions = []
        actions = foodActions
        updateViews()
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        category = "home"
        actions = []
        actions = homeActions
        updateViews()
    }
    
    @IBAction func travelButtonTapped(_ sender: Any) {
        category = "travel"
        actions = []
        actions = travelActions
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
        }
    
    // MARK: - Table view data source
    func setUpView() {
        actions.append(contentsOf: foodActions)
        actions.append(contentsOf: homeActions)
        actions.append(contentsOf: travelActions)
    }
    
    func updateViews() {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return actions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "actionCell", for: indexPath) as? ActionListTableViewCell else { return UITableViewCell() }
//        cell.textLabel?.text = actions[indexPath.row].action
        cell.listCellLabel.text = actions[indexPath.row].action
        
        switch actions[indexPath.row].icon {
        case "Food":
            cell.listCellImage.image = UIImage(named: "Food")
        case "house":
            cell.listCellImage.image = UIImage(named: "home")
        default:
            cell.listCellImage.image = UIImage(named: "TravelIcon")
        }
        return cell
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toActionDetail" {
            let destinationVC = segue.destination as? ActionDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { print("Problem in actionListTableViewController prepare")
                return
            }
            let chosenAction = actions[indexPath.row]
            destinationVC?.action = chosenAction
        }
    }
}
