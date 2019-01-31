//
//  SettingsTableViewController.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 29/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit
import UserNotifications

class SettingsTableViewController: UITableViewController {
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    @IBAction func notificationButtonTapped(_ sender: Any) {
        print("notificationButtonTapped")
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
            return
        }
        
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)") // Prints true
            })
        }
    }
    
    // MARK: - Actions
    @IBAction func doneButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
