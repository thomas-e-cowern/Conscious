//
//  TransparentNavigationController.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 31/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class TransparentNavigationController: UINavigationController {
    // MARK: - Properties
    override var preferredStatusBarStyle: UIStatusBarStyle { // Sets the status bar style to be light
        return .lightContent
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    // MARK: - Setup
    func setupViews() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.prefersLargeTitles = false
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
    
}