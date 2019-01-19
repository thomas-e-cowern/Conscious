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
    
    var myActions: [String] = ["Meatless Monday", "Become Vegetarian", "Eat Seasonal", "Wash Clothes in Cold Water", "Consider Green Power", "Avoid Flying", "Take The Bus", "Carpool"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myActionsTableview.dataSource = self
        myActionsTableview.reloadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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

extension MyActionsViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myActions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myActionsCell", for: indexPath)
        cell.textLabel?.text = myActions[indexPath.row]
        return cell
    }
    
}
