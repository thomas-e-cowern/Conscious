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
    @IBOutlet weak var foodScoreLabel: UILabel!
    @IBOutlet weak var foodGraph: UIView!
    @IBOutlet weak var houseScoreLabel: UILabel!
    @IBOutlet weak var houseGraph: UIView!
    @IBOutlet weak var travelScoreLabel: UILabel!
    @IBOutlet weak var travelGraph: UIView!
    @IBOutlet weak var treesLabel: UILabel!
    @IBOutlet weak var treesImageView: UIImageView!
    @IBOutlet weak var trashLabel: UILabel!
    @IBOutlet weak var trashImageView: UIImageView!
    @IBOutlet weak var gasLabel: UILabel!
    @IBOutlet weak var gasImageView: UIImageView!
    @IBOutlet weak var foodWidthGraph: NSLayoutConstraint!
    @IBOutlet weak var houseWidthGraph: NSLayoutConstraint!
    @IBOutlet weak var travelWidthGraph: NSLayoutConstraint!
    
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setFoodGraph()
        setHouseGraph()
        setTravelGraph()
    }
    
    // MARK: - Graphs
    // FOOD
    func setFoodGraph(){
        UIView.animate(withDuration: 8) {
            self.foodWidthGraph.constant =  CGFloat(GreenCalculatorController.shared.calculateFoodScore() ?? 0)
            self.view.layoutIfNeeded()
        }
    }
    
    // HOUSE
    func setHouseGraph(){
        UIView.animate(withDuration: 8) {
            self.houseWidthGraph.constant =  CGFloat(GreenCalculatorController.shared.calculateHouseScore() ?? 0)
            self.view.layoutIfNeeded()
        }
    }
    
    // TRAVEL
    func setTravelGraph(){
        UIView.animate(withDuration: 8) {
            self.travelWidthGraph.constant =  CGFloat(GreenCalculatorController.shared.calculateTravelScore() ?? 0)
            self.view.layoutIfNeeded()
        }
    }
    
    
    // Images
    // Trees
    func setScoreImage() {
        if GreenCalculatorController.shared.totalScoreCard() > 50 {
            treesImageView.image = #imageLiteral(resourceName: "4trees")
        } else if GreenCalculatorController.shared.totalScoreCard() < 100 {
            treesImageView.image = #imageLiteral(resourceName: "alltrees")
        }
        
        // Trash
        
        // Gas
    }
    

    // MARK: - Actions
    func updateViews() {
        scoreLabel.text = "\(GreenCalculatorController.shared.totalScoreCard())"
        foodScoreLabel.text = "\(GreenCalculatorController.shared.calculateFoodScore() ?? 0)"
        houseScoreLabel.text = "\(GreenCalculatorController.shared.calculateHouseScore() ?? 0)"
        travelScoreLabel.text = "\(GreenCalculatorController.shared.calculateTravelScore() ?? 0)"
        setScoreImage()
    }
}
