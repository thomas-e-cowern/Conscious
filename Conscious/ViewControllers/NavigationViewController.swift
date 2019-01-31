//
//  NavigationViewController.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 31/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    // MARK: - Properties
    override var preferredStatusBarStyle: UIStatusBarStyle { // Sets the status bar style to be light
        return .lightContent
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupViews()
    }
    
    // MARK: - Setup
    func setupViews() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
}
