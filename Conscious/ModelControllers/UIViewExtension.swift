//
//  UIViewExtension.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 06/02/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

extension UIView {
    
    func addDropShadow() {
        self.layer.cornerRadius = 5
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 0.3
    }
}
