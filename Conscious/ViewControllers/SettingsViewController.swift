//
//  SettingsViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/19/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func doneButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
}
