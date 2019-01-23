//
//  ActionDetailViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/18/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ActionDetailViewController: UIViewController {

    // MARK: - Properties
    var action: String? = ""
    
    // MARK: - Outlets
    @IBOutlet weak var addToActionListButton: UIButton!
    @IBOutlet weak var actionTitleLabel: UILabel!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        actionTitleLabel.text = action
    }
 
    // MARK: - Actions
    @IBAction func addToActionListButtonTapped(_ sender: Any) {
        guard let action = action else { return }
        addToActionListButton.setTitle("Added to Action List", for: .normal)
        ActionsAlarmController.shared.addAlarm(fireDate: Date(), name: action, message: "This is the alarm message", enabled: true, repeats: true)
        ActionPlanController.shared.userActionList.append(action)
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }
}
