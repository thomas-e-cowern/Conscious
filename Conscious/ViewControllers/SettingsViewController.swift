//
//  SettingsViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/19/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit
import UserNotifications

class SettingsViewController: UIViewController {
    
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
        dismiss(animated: true, completion: nil)
    }
}
