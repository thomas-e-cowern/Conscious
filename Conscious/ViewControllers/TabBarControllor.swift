//
//  TabBarControllor.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 25/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class TabBarControllor: UITabBarController {
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 1
        //navigationItem.setHidesBackButton(true, animated: false)
        //self.navigationItem.leftBarButtonItem = nil
    }
}
