//
//  ActionDetailViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/18/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class ActionDetailViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var addToActionListButton: UIButton!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
     // MARK: - Navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     }
    
    // MARK: - Actions
    @IBAction func addToActionListButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
        
    }
}
