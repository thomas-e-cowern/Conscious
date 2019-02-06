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
        //navigationBar.prefersLargeTitles = true
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
    
    func restoreDefaultNavBar() {
        navigationBar.setBackgroundImage(nil, for: .default)
        navigationBar.shadowImage = nil
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        setUpSettingsButton()
    }
    
    func setUpSettingsButton(){
        let settingsButton = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(presentSettingsViewController))
        self.navigationItem.rightBarButtonItem = settingsButton
    }
    
    @objc func presentSettingsViewController() {
        guard let settingVC = UIStoryboard.init(name: "Settings", bundle: .main).instantiateInitialViewController() else { return }
        self.present(settingVC, animated: true, completion: nil)
    }
}
