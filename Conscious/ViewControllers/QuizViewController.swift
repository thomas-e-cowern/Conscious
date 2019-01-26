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
    var question: Question? {
        didSet{
            toggleNextButtonEnabledIfNeeded()
        }
    }
    var questionIndex = 0 {
        didSet{
            toggleBackButtonEnabledIfNeeded()
        }
    }
    var allQs = GreenCalculatorController.shared.allQuestions
    var answer: Answer?
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
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
        updateImageView()
    }
    
    func updateImageView() {
        if question?.category.rawValue == "Food" {
            categoryImageView.image = #imageLiteral(resourceName: "Cow")
        } else if question?.category.rawValue == "House" {
            categoryImageView.image = #imageLiteral(resourceName: "House")
        } else if question?.category.rawValue == "Travel" {
            categoryImageView.image = #imageLiteral(resourceName: "Travel")
        }
    }
    
    func nextQuestion() {
        questionIndex += 1
        if questionIndex < allQs.count {
            updateViews()
        } else {
            performSegue(withIdentifier: "scoreSegue", sender: nil)
        }
    }
    
    func toggleBackButtonEnabledIfNeeded(){
        previousButton.isEnabled = questionIndex != 0
    }
    
    func toggleNextButtonEnabledIfNeeded(){
        guard let question = question else { return }
        nextButton.isEnabled = !question.selectedAnswers.isEmpty
    }
    
    func previousQuestion() {
        questionIndex -= 1
        if questionIndex <= allQs.count {
            updateViews()
        } 
    }
    
    func append(_ answer: Answer){
        guard let question = question  else { return }
        if question.questionType == .mutuallyExclusive {
            question.selectedAnswers = []
        }
        question.selectedAnswers.append(answer)
    }
    
    // MARK: - Actions
    @IBAction func nextButtonTapped(_ sender: Any) {
        nextQuestion()
    }
    
    @IBAction func previousButtonTapped(_ sender: Any) {
        previousQuestion()
    }
}

extension QuizViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question?.possibleAnswers.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let question = question else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "answerCell", for: indexPath) as! QuizTableViewCell
        let answer = question.possibleAnswers[indexPath.row]
        cell.answer = answer
        setAnswerSelected(for: cell)
        return cell
    }
    
    func toggleAnswerSelected(for cell: QuizTableViewCell) {
        guard let answer = cell.answer else { return }
        cell.answerSelected ? userDidDeselectAnswer(answer: answer, cell: cell) : userDidSelect(answer: answer, cell: cell)
        toggleNextButtonEnabledIfNeeded()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! QuizTableViewCell
        toggleAnswerSelected(for: cell)
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let question = question, question.questionType == .mutuallyExclusive else { return }
        let cell = tableView.cellForRow(at: indexPath) as! QuizTableViewCell
        guard let answer = cell.answer else { return }
        userDidDeselectAnswer(answer: answer, cell: cell)
    }
    
    func setAnswerSelected(for cell: QuizTableViewCell) {
        guard let question = question else { return }
        var contains = false
        for answer in question.selectedAnswers{
            if answer.rawValue == cell.answer?.rawValue{
                contains = true
            }
        }
        cell.answerSelected = contains
    }
}

extension QuizViewController {
    func userDidDeselectAnswer(answer: Answer, cell: QuizTableViewCell) {
        // FOOD
        if answer is WastedFood{
            GreenCalculatorController.shared.wastedFood = nil
        } else if answer is LocallyProducedFood {
            GreenCalculatorController.shared.locallyProducedFood = nil
        } else if answer is DietType {
            GreenCalculatorController.shared.dietType = nil
        } else if answer is ThrownFood {
            GreenCalculatorController.shared.thrownFood = nil
            // HOUSE
        } else if answer is NumberOfHouseHoldMembers {
            GreenCalculatorController.shared.numberOfHouseholdMembers = nil
        } else if answer is HouseTempInWinter {
            GreenCalculatorController.shared.houseTempInWinter = nil
        } else if answer is TurnOffLights {
            GreenCalculatorController.shared.turnOffLights = nil
        } else if answer is TypeOfHouse {
            GreenCalculatorController.shared.typeOfHouse = nil
        } else if answer is HouseHeatingFuel {
            GreenCalculatorController.shared.houseHeatingFuel = nil
        } else if answer is EnergySavingImprovement {
            //            GreenCalculatorController.shared.energySavingImprovement = nil
        } else if answer is WasteRecycling {
            //GreenCalculatorController.shared.wasteRecycling = nil
            // TRAVEL
        } else if answer is PersonalTransportation {
            GreenCalculatorController.shared.personalTransportation = nil
        } else if answer is MostUsedVechile {
            GreenCalculatorController.shared.mostUsedVechile = nil
        } else if answer is NumberOfFlight {
            GreenCalculatorController.shared.numberOfFlight = nil
        } else if answer is NumberOfDrivesPerWeek {
            GreenCalculatorController.shared.numberOfDrivesPerWeek = nil
        }
        guard let question = question , let index = answer.index(in: question.selectedAnswers) else { return }
        question.selectedAnswers.remove(at: index)
        setAnswerSelected(for: cell)
    }
    
    func userDidSelect(answer: Answer, cell: QuizTableViewCell) {
        // FOOD
        if let wastedFood = answer as? WastedFood {
            GreenCalculatorController.shared.wastedFood = wastedFood
        } else if let locallyProducedFood = answer as? LocallyProducedFood {
            GreenCalculatorController.shared.locallyProducedFood = locallyProducedFood
        } else if let dietType = answer as? DietType {
            GreenCalculatorController.shared.dietType = dietType
        } else if let thrownFood = answer as? ThrownFood {
            GreenCalculatorController.shared.thrownFood = thrownFood
            // HOUSE
        } else if let numberOfHouseHoldMembers = answer as? NumberOfHouseHoldMembers {
            GreenCalculatorController.shared.numberOfHouseholdMembers = numberOfHouseHoldMembers
        } else if let houseTempInWinter = answer as? HouseTempInWinter {
            GreenCalculatorController.shared.houseTempInWinter = houseTempInWinter
        } else if let turnOffLights = answer as? TurnOffLights {
            GreenCalculatorController.shared.turnOffLights = turnOffLights
        } else if let typeOfHouse = answer as? TypeOfHouse {
            GreenCalculatorController.shared.typeOfHouse = typeOfHouse
        } else if let houseHeatingFuel = answer as? HouseHeatingFuel {
            GreenCalculatorController.shared.houseHeatingFuel = houseHeatingFuel
        } else if let energySavingImprovement = answer as? EnergySavingImprovement {
            GreenCalculatorController.shared.energySavingImprovement.append(energySavingImprovement)
        } else if let wasteRecycling = answer as? WasteRecycling {
            GreenCalculatorController.shared.wasteRecycling.append(wasteRecycling)
            // TRAVEL
        } else if let personalTransportation = answer as? PersonalTransportation {
            GreenCalculatorController.shared.personalTransportation = personalTransportation
        } else if let mostUsedVechile = answer as? MostUsedVechile {
            GreenCalculatorController.shared.mostUsedVechile = mostUsedVechile
        } else if let numberOfFlight = answer as? NumberOfFlight {
            GreenCalculatorController.shared.numberOfFlight = numberOfFlight
        } else if let numberOfDrivesPerWeek = answer as? NumberOfDrivesPerWeek {
            GreenCalculatorController.shared.numberOfDrivesPerWeek = numberOfDrivesPerWeek
        }
        append(answer)
        setAnswerSelected(for: cell)
    }
}
