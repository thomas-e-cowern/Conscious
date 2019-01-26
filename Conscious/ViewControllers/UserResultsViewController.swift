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
    
    // Green Scores
    var totalScore = 0.0
    var foodPercentage: CGFloat = 0.0
    var housePercentage: CGFloat = 0.0
    var travelPercentage: CGFloat = 0.0
    
    // Local storage
    var savedData: [SavedData] = []
    var savedOverallScore: Double = 0.0
    var savedFoodScore: Double = 0.0
    var savedHouseScore: Double = 0.0
    var savedTravelScore:   Double = 0.0
    var loadPreviousScore: Bool = false
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        totalScore = GreenCalculatorController.shared.totalScoreCard()
        savedOverallScore = totalScore
        updateViews()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setUpPersistence()
        totalScore = GreenCalculatorController.shared.totalScoreCard()
        setFoodGraph()
        setHouseGraph()
        setTravelGraph()
        updateViews()
    }
    
    
    
    // MARK: - Graphs
    // FOOD
    func setFoodGraph(){
        UIView.animate(withDuration: 2.5) {
            guard let foodScore = GreenCalculatorController.shared.calculateFoodScore() else {
                print("Food score error")
                return
                
            }
            self.savedFoodScore = foodScore
            self.foodPercentage = CGFloat((foodScore/self.totalScore)*100)
            self.foodWidthGraph.constant = self.foodPercentage
            self.view.layoutIfNeeded()
        }
    }
    
    // HOUSE
    func setHouseGraph(){
        UIView.animate(withDuration: 2.5) {
            guard let houseScore = GreenCalculatorController.shared.calculateHouseScore() else {
                print("House score error")
                return
            }
            self.savedHouseScore = houseScore
            self.housePercentage = CGFloat((houseScore/self.totalScore)*100)
            self.houseWidthGraph.constant =  self.housePercentage
            self.view.layoutIfNeeded()
        }
    }
    
    // TRAVEL
    func setTravelGraph(){
        UIView.animate(withDuration: 2.5) {
            guard let travelScore = GreenCalculatorController.shared.calculateTravelScore() else {
                print("Travel score error")
                return
            }
            self.savedTravelScore = travelScore
            self.travelPercentage = CGFloat((travelScore/self.totalScore)*100)
            self.travelWidthGraph.constant =  self.travelPercentage
            self.view.layoutIfNeeded()
        }
    }
    
    
    
    // MARK: - Images
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
    
    // MARK: Setup Persistence
    func setUpPersistence() {
        if LocalStorageController.shared.hasBeenHereBefore == false {
            let newScore = SavedData(overallScore: savedOverallScore, foodScore: savedFoodScore, houseScore: savedHouseScore, travelScore: savedTravelScore, actionPlan: [])
            LocalStorageController.shared.savedData.append(newScore)
            LocalStorageController.shared.saveToPersistentStore()
        } else {
            savedData = LocalStorageController.shared.loadFromPersistenceStore()
            loadPreviousScore = true
        }
        
    }
    
    // MARK: - Setup
    func updateViews() {
        print(LocalStorageController.shared.hasBeenHereBefore)
        print(savedData)
        scoreLabel.text = String(format: "%.2f", totalScore/12)
        foodScoreLabel.text = String(format: "%.2f%%", foodPercentage)
        houseScoreLabel.text = String(format: "%.2f%%", housePercentage)
        travelScoreLabel.text = String(format: "%.2f%%", travelPercentage)
        setScoreImage()
        LocalStorageController.shared.hasBeenHereBefore = true
    }
}
