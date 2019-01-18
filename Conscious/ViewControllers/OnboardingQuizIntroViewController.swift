//
//  OnboardingQuizIntroViewController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/18/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class OnboardingQuizIntroViewController: UIViewController {
    
    @IBOutlet weak var iconImage: UIView!
    @IBOutlet weak var quizButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iconImage.layer.cornerRadius = 87
        quizButton.layer.cornerRadius = 5
        
    }
    
    @IBAction func quizButtonTapped(_ sender: Any) {
        // Starts the Quiz
    }
}
