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
    
    @IBOutlet weak var notificationSwtich: UISwitch!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Methods
    @IBAction func notificationsDidChange(_ sender: Any) {
        print(notificationSwtich.isOn)
        
        if !notificationSwtich.isOn {
            print("Should be turning notifications off")
            func cancelUserNotifications(for alarm: Alarm) {
                UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            }
            
        }
        //        var notificationRawStatus: Int = 1
        //        UNUserNotificationCenter.current().getNotificationSettings { settings in
        //            notificationRawStatus = Int(settings.authorizationStatus.rawValue)
        //            print(notificationRawStatus)
        //
        //        }
    }
    
    // MARK: - Actions
    @IBAction func doneButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
