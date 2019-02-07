//
//  ActionListTableViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/18/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ActionListTableViewController: UITableViewController {

    
    // MARK: - Outlets
    @IBOutlet weak var travelUnderlineView: UIView!
    @IBOutlet weak var homeUnderlineView: UIView!
    @IBOutlet weak var allUnderlineView: UIView!
    @IBOutlet weak var foodUnderlineView: UIView!
    
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
        allUnderlineView.backgroundColor = #colorLiteral(red: 0.6899999976, green: 0.7799999714, blue: 0.5899999738, alpha: 1)
    }

    // MARK: - Actions
    @IBAction func allButtonTapped(_ sender: Any) {
        actions = []
        setUpView()
        allUnderlineView.backgroundColor = #colorLiteral(red: 0.6899999976, green: 0.7799999714, blue: 0.5899999738, alpha: 1)
        foodUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        homeUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        travelUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        updateViews()
        
    }
    @IBAction func foodButtonTapped(_ sender: Any) {
        category = "food"
        actions = []
        actions = foodActions
        allUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        foodUnderlineView.backgroundColor = #colorLiteral(red: 0.9399999976, green: 0.4199999869, blue: 0.3400000036, alpha: 1)
        homeUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        travelUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        updateViews()
    }
    
    @IBAction func homeButtonTapped(_ sender: Any) {
        category = "home"
        actions = []
        actions = homeActions
        allUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        foodUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        homeUnderlineView.backgroundColor = #colorLiteral(red: 0.4900000095, green: 0.8299999833, blue: 0.6899999976, alpha: 1)
        travelUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        updateViews()
    }
    
    @IBAction func travelButtonTapped(_ sender: Any) {
        category = "travel"
        actions = []
        actions = travelActions
        allUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        foodUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        homeUnderlineView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0)
        travelUnderlineView.backgroundColor = #colorLiteral(red: 1, green: 0.7599999905, blue: 0.02999999933, alpha: 1)
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.backgroundColor = .white
        self.navigationController?.view.backgroundColor = .white
        if let navController = self.navigationController as? TransparentNavigationController {
            navController.restoreDefaultNavBar()
            navController.hidesBarsOnSwipe = true
        }
        updateViews()
        }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let navController = self.navigationController as? TransparentNavigationController {
            navController.setupViews()
        }
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
//        let actionsAdded = actions.filter { $0.added == false }.count
        return actions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "actionCell", for: indexPath) as? ActionListTableViewCell else { return UITableViewCell() }
        actions.sort { $0.action < $1.action }
        cell.listCellLabel.text = actions[indexPath.row].action
        
        switch actions[indexPath.row].icon {
        case "Food":
            cell.listCellImage.image = #imageLiteral(resourceName: "FoodIcon")
        case "house":
            cell.listCellImage.image = #imageLiteral(resourceName: "HomeIcon")
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
            destinationVC?.buttonActive = true
        }
    }
}

// MARK: - TableViewDelegate Methods
extension ActionListTableViewController {
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
