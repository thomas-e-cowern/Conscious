//
//  ActionListTableViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/18/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ActionListTableViewController: UITableViewController {

    var category: String = ""
    var foodActions: [String] = ActionPlanController.shared.foodActions
    var homeActions: [String] = ActionPlanController.shared.homeActions
    var travelActions: [String] = ActionPlanController.shared.travelActions
    var actions: [String] = []
//    var pulledAction: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    @IBAction func foorButtonTapped(_ sender: Any) {
        category = "food"
        actions = []
        actions += foodActions
        updateViews()
    }
    @IBAction func homeButtonTapped(_ sender: Any) {
        category = "home"
        actions = []
        actions += homeActions
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "actionCell", for: indexPath)
        cell.textLabel?.text = actions[indexPath.row]
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toActionDetail" {
            let destinationVC = segue.destination as? ActionDetailViewController
            let index = tableView.indexPathForSelectedRow
            let action = actions[index?.row ?? 0]
            destinationVC?.action = action
        }
        
    }
    

}
