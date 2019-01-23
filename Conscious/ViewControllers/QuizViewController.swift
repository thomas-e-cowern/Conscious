//
//  QuizViewController.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var quizProgressView: UIProgressView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    // MARK: - Properties
    var food: Food?
    var house: House?
    var travel: Travel?
    var question: Question?
    var questionIndex = 0
    var allQs = GreenCalculatorController.shared.allQuestions
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.reloadData()
        self.question = allQs[questionIndex]
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.question = allQs[questionIndex]
        updateViews()
        tableView.reloadData()
    }
    
    // MARK: - Setup
    func updateViews() {
        let totalProgress = Float(questionIndex) / Float(allQs.count)
        self.question = allQs[questionIndex]
        categoryLabel.text = self.question?.category.rawValue
        questionLabel.text = self.question?.text
        quizProgressView.setProgress(totalProgress, animated: true)
        tableView.reloadData()
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < allQs.count {
            updateViews()
        } else {
            performSegue(withIdentifier: "scoreSegue", sender: nil)
        }
    }
    
    func previousQuestion() {
        questionIndex -= 1
        if questionIndex <= allQs.count {
            updateViews()
        } 
    }
    
    // MARK: - Actions
    @IBAction func nextButtonTapped(_ sender: Any) {
        nextQuestion()
    }
    
    @IBAction func previousButtonTapped(_ sender: Any) {
        previousQuestion()
    }
}

extension QuizViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question?.possibleAnswers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! QuizTableViewCell
        let answer = question?.possibleAnswers[indexPath.row]
        cell.answer = answer
        return cell
    }
}

extension QuizViewController: QuizTableViewCellDelegate {
    func userDidDeselectAnswer(answer: Answer) {
        guard let index = answer.index(in: GreenCalculatorController.shared.userAnswers) else { return }
        GreenCalculatorController.shared.userAnswers.remove(at: index)
    }
    
    func userDidSelect(answer: Answer) {
            // FOOD
        if let wastedFood = answer as? WastedFood{
            GreenCalculatorController.shared.wastedFood = wastedFood
        } else if let locallyProducedFood = answer as? LocallyProducedFood{
            GreenCalculatorController.shared.locallyProducedFood = locallyProducedFood
        } else if let dietType = answer as? DietType{
            GreenCalculatorController.shared.dietType = dietType
        } else if let thrownFood = answer as? ThrownFood{
            GreenCalculatorController.shared.thrownFood = thrownFood
            // HOUSE
        } else if let numberOfHouseHoldMembers = answer as? NumberOfHouseHoldMembers{
            GreenCalculatorController.shared.numberOfHouseholdMembers = numberOfHouseHoldMembers
        } else if let houseTempInWinter = answer as? HouseTempInWinter{
            GreenCalculatorController.shared.houseTempInWinter = houseTempInWinter
        } else if let turnOffLights = answer as? TurnOffLights{
            GreenCalculatorController.shared.turnOffLights = turnOffLights
        } else if let typeOfHouse = answer as? TypeOfHouse{
            GreenCalculatorController.shared.typeOfHouse = typeOfHouse
        } else if let houseHeatingFuel = answer as? HouseHeatingFuel{
            GreenCalculatorController.shared.houseHeatingFuel = houseHeatingFuel
        } else if let energySavingImprovement = answer as? EnergySavingImprovement{
            GreenCalculatorController.shared.energySavingImprovement = energySavingImprovement
        } else if let wasteRecycling = answer as? WasteRecycling{
            GreenCalculatorController.shared.wasteRecycling = wasteRecycling
            // TRAVEL
        } else if let personalTransportation = answer as? PersonalTransportation{
            GreenCalculatorController.shared.personalTransportation = personalTransportation
        } else if let mostUsedVechile = answer as? MostUsedVechile{
            GreenCalculatorController.shared.mostUsedVechile = mostUsedVechile
        } else if let numberOfFlight = answer as? NumberOfFlight{
            GreenCalculatorController.shared.numberOfFlight = numberOfFlight
        } else if let numberOfDrivesPerWeek = answer as? NumberOfDrivesPerWeek{
            GreenCalculatorController.shared.numberOfDrivesPerWeek = numberOfDrivesPerWeek
        }
    }
}
