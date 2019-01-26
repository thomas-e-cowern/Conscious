//
//  GreenCalculatorController.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

class GreenCalculatorController {
    
    // Shared Instance
    static let shared = GreenCalculatorController()
    
    // Source of Truth
    var userAnswers: [Answer] = []
    
    // MARK: - Properties
    // FOOD
    var wastedFood: WastedFood?
    var locallyProducedFood: LocallyProducedFood?
    var dietType: DietType?
    var thrownFood: ThrownFood?
    
    // HOUSE
    var numberOfHouseholdMembers: NumberOfHouseHoldMembers?
    var houseTempInWinter: HouseTempInWinter?
    var turnOffLights: TurnOffLights?
    var typeOfHouse: TypeOfHouse?
    var houseHeatingFuel: HouseHeatingFuel?
    var energySavingImprovement: [EnergySavingImprovement] = []
    var wasteRecycling: [WasteRecycling] = []
    
    // TRAVEL
    var personalTransportation: PersonalTransportation?
    var mostUsedVechile: MostUsedVechile?
    var numberOfFlight: NumberOfFlight?
    var numberOfDrivesPerWeek: NumberOfDrivesPerWeek?
    
    // MARK: - Questions
    lazy var allQuestions: [Question] = [
        Question(text: "Of the food you buy how much is wasted and thrown away?", category: .food, possibleAnswers: WastedFood.possibleAnswers, questionType: .mutuallyExclusive),
        Question(text: "How often do you buy locally produced food?", category: .food, possibleAnswers: LocallyProducedFood.possibleAnswers, questionType: .mutuallyExclusive),
        Question(text: "How would you best describe your diet?", category: .food, possibleAnswers: DietType.possibleAnswers, questionType: .mutuallyExclusive),
        Question(text: "Of the food you buy how much is wasted and thrown away?", category: .food, possibleAnswers: ThrownFood.possibleAnswers, questionType: .mutuallyExclusive),
        Question(text: "What type of house do you live in?", category: .house, possibleAnswers: TypeOfHouse.possibleAnswers, questionType: .mutuallyExclusive),
        Question(text: "How many people live in the house above the age of 18?", category: .house, possibleAnswers: NumberOfHouseHoldMembers.possibleAnswers, questionType: .mutuallyExclusive),
        Question(text: "What temperature do you keep your house at in the winter?", category: .house, possibleAnswers: HouseTempInWinter.possibleAnswers, questionType: .mutuallyExclusive),
        Question(text: "Do you regularly turn off lights and appliances when not used for long periods of time?", category: .house, possibleAnswers: TurnOffLights.possibleAnswers, questionType: .mutuallyExclusive),
        Question(text: "How do you heat your home?", category: .house, possibleAnswers: HouseHeatingFuel.possibleAnswers, questionType: .mutuallyExclusive),
        Question(text: "Do you have any of these energy saving improvements in your home?", category: .house, possibleAnswers: EnergySavingImprovement.possibleAnswers, questionType: .multipleAnswer),
        Question(text: "Which of the following do you recycle?", category: .house, possibleAnswers: WasteRecycling.possibleAnswers, questionType: .multipleAnswer),
        Question(text: "In the last year, how many round trip flights have you made?", category: .travel, possibleAnswers: NumberOfFlight.possibleAnswers, questionType: .mutuallyExclusive),
        Question(text: "What kind of vehicle do you travel in most?", category: .travel, possibleAnswers:MostUsedVechile.possibleAnswers, questionType: .mutuallyExclusive),
        Question(text: "How many miles a week do you drive?", category: .travel, possibleAnswers: NumberOfDrivesPerWeek.possibleAnswers, questionType: .mutuallyExclusive),
        ]
    
    // MARK: - Calculators(Results)
    // FOOD
    func calculateFoodScore() -> Double? {
        guard let dietType = dietType?.results,
            let localFood = locallyProducedFood?.results,
            let wastedFood = wastedFood?.results,
            let thrownFood = thrownFood?.results else { return nil }
        if dietType < 1.6 {
            isVegetarian = true
        }
        if localFood >= 0.15 {
            buysLocally = true
        }
        if wastedFood < 0.039 {
            composts = true
        }
        return dietType - (dietType * localFood) + wastedFood + thrownFood
    }
    
    func calculateFoodPercentage() -> Double {
        return calculateFoodScore() ?? 0 / totalScoreCard()
    }
    
    // HOUSE
    func calculateHouseScore() -> Double? {
        guard let numberOfHouseholdMembers = numberOfHouseholdMembers?.results,
            let houseTempInWinter = houseTempInWinter?.results,
            let turnOffLights = turnOffLights?.results,
            let typeOfHouse = typeOfHouse?.results,
            let houseHeatingFuel = houseHeatingFuel?.results,
            let energySavingImprovement = energySavingImprovement.first?.results,
            let wasteRecycling = wasteRecycling.first?.results else { return nil }
        if houseTempInWinter > 0.2 {
            lowTemp = true
        }
        if energySavingImprovement > 0 {
            lightBulbs = true
        }
        if wasteRecycling > 0 {
            recycles = true
        }
        let totalHomeEmissions = numberOfHouseholdMembers + typeOfHouse + houseHeatingFuel
        return ((totalHomeEmissions) - (totalHomeEmissions * houseTempInWinter)) - (turnOffLights + energySavingImprovement + wasteRecycling)
    }
    
    func calculateHousePercentage() -> Double {
        return calculateHouseScore() ?? 0 / totalScoreCard()
    }
    
    // TRAVEL
    func calculateTravelScore() -> Double? {
//        guard let personalTransportation = personalTransportation?.results,
            guard let mostUsedVechile = mostUsedVechile?.results,
            let numberOfFlight = numberOfFlight?.results,
            let numberOfDrivesPerWeek = numberOfDrivesPerWeek?.results else { return nil }
        if mostUsedVechile == 0.0 {
            ownsCar = false
        }
        return mostUsedVechile + numberOfFlight + numberOfDrivesPerWeek
    }
    
    func calculateTravelPercentage() -> Double {
        return calculateTravelScore() ?? 0 / totalScoreCard()
    }
    
    // GREEN
    func totalScoreCard() -> Double {

        return (calculateFoodScore() ?? 0) + (calculateHouseScore() ?? 0) + (calculateTravelScore() ?? 0)
    }
    
    
}
