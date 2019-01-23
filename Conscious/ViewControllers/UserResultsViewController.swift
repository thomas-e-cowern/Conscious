//
//  UserResultsViewController.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 22/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class UserResultsViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var foodGraph: UIView!
    @IBOutlet weak var homeGraph: UIView!
    @IBOutlet weak var travelGraph: UIView!
    @IBOutlet weak var treesLabel: UILabel!
    @IBOutlet weak var treesImageView: UIImageView!
    @IBOutlet weak var trashLabel: UILabel!
    @IBOutlet weak var trashImageView: UIImageView!
    @IBOutlet weak var gasLabel: UILabel!
    @IBOutlet weak var gasImageView: UIImageView!
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    // MARK: - Graphs
    // FOOD
    func setFoodGraph(){
        UIView.animate(withDuration: 2.0) {
//            self.foodViewHeightConstraint.constant =  GreenCalculatorController.shared.calculateFoodPercentage()
            self.view.layoutIfNeeded()
        }
    }
    
    // HOUSE
    func setHouseGraph(){
        UIView.animate(withDuration: 2.0) {
//            self.houseViewHeightConstraint.constant =  GreenCalculatorController.shared.calculateHousePercentage()
            self.view.layoutIfNeeded()
        }
    }
    
    // TRAVEL
    func setTravelGraph(){
        UIView.animate(withDuration: 2.0) {
//            self.travelViewHeightConstraint.constant =  GreenCalculatorController.shared.calculateTravelPercentage()
            self.view.layoutIfNeeded()
        }
    }
    
    // MARK: - Actions
    func updateViews() {
        
    }
}
