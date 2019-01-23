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
    var energySavingImprovement: EnergySavingImprovement?
    var wasteRecycling: WasteRecycling?
    
    // TRAVEL
    var personalTransportation: PersonalTransportation?
    var mostUsedVechile: MostUsedVechile?
    var numberOfFlight: NumberOfFlight?
    var numberOfDrivesPerWeek: NumberOfDrivesPerWeek?
    
    // MARK: - Questions
    lazy var allQuestions: [Question] = [
        Question(text: "Of the food you buy how much is wasted and thrown away?", category: .food, possibleAnswers: WastedFood.possibleAnswers),
        Question(text: "How often do you buy locally produced food?", category: .food, possibleAnswers: LocallyProducedFood.possibleAnswers),
        Question(text: "How would you best describe your diet?", category: .food, possibleAnswers: DietType.possibleAnswers),
        Question(text: "Of the food you buy how much is wasted and thrown away?", category: .food, possibleAnswers: ThrownFood.possibleAnswers),
        Question(text: "What type of house do you live in?", category: .house, possibleAnswers: TypeOfHouse.possibleAnswers),
        Question(text: "How many people live in the house above the age of 18?", category: .house, possibleAnswers: NumberOfHouseHoldMembers.possibleAnswers),
        Question(text: "What temperature do you keep your house at in the winter?", category: .house, possibleAnswers: HouseTempInWinter.possibleAnswers),
        Question(text: "Do you regularly turn off lights and appliances when not used for long periods of time?", category: .house, possibleAnswers: TurnOffLights.possibleAnswers),
        Question(text: "How do you heat your home?", category: .house, possibleAnswers: HouseHeatingFuel.possibleAnswers),
        Question(text: "Do you have any of these energy saving improvements in your home?", category: .house, possibleAnswers: EnergySavingImprovement.possibleAnswers),
        Question(text: "Which of the following do you recycle?", category: .house, possibleAnswers: WasteRecycling.possibleAnswers),
        Question(text: "In the last year, how many round trip flights have you made?", category: .travel, possibleAnswers: NumberOfFlight.possibleAnswers),
        Question(text: "What kind of vehicle do you travel in most?", category: .travel, possibleAnswers:MostUsedVechile.possibleAnswers),
        Question(text: "How many miles a week do you drive?", category: .travel, possibleAnswers: NumberOfDrivesPerWeek.possibleAnswers)
    ]
    
    // MARK: - Calculators(Results)
    // FOOD
    func calculateFoodScore() -> Double? {
        guard let dietType = dietType?.results,
            let localFood = locallyProducedFood?.results,
            let wastedFood = wastedFood?.results,
            let thrownFood = thrownFood?.results else { return nil }
        
        return dietType - (dietType * localFood) + wastedFood + thrownFood
    }
    
    func calculateFoodPercentage() -> Double{
        return calculateFoodScore() ?? 0 / totalScoreCard()
    }
    
    // HOUSE
    func calculateHouseScore() -> Double? {
        guard let numberOfHouseholdMembers = numberOfHouseholdMembers?.results,
            let houseTempInWinter = houseTempInWinter?.results,
            let turnOffLights = turnOffLights?.results,
            let typeOfHouse = typeOfHouse?.results,
            let houseHeatingFuel = houseHeatingFuel?.results,
            let energySavingImprovement = energySavingImprovement?.results,
            let wasteRecycling = wasteRecycling?.results else { return nil }
        
        let totalHomeEmissions = numberOfHouseholdMembers + typeOfHouse + houseHeatingFuel
        return ((totalHomeEmissions) - (totalHomeEmissions * houseTempInWinter)) - (turnOffLights + energySavingImprovement + wasteRecycling)
    }
    
    func calculateHousePercentage() -> Double{
        return calculateHouseScore() ?? 0 / totalScoreCard()
    }
    
    // TRAVEL
    func calculateTravelScore() -> Double? {
        guard let personalTransportation = personalTransportation?.results,
            let mostUsedVechile = mostUsedVechile?.results,
            let numberOfFlight = numberOfFlight?.results,
            let numberOfDrivesPerWeek = numberOfDrivesPerWeek?.results else { return nil }
        
        return personalTransportation + mostUsedVechile + numberOfFlight + numberOfDrivesPerWeek
    }
    
    func calculateTravelPercentage() -> Double{
        return calculateTravelScore() ?? 0 / totalScoreCard()
    }
    
    // GREEN
    func totalScoreCard() -> Double {
        guard let foodCal = calculateFoodScore(),
            let houseCal = calculateHouseScore(),
            let travelCal = calculateTravelScore() else { return 0 }
        
        return houseCal + travelCal + foodCal
    }
}
