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
    
    // MARK: - Questions
    // FOOD
    lazy var allQuestions = [
        Question(text: "Of the food you buy how much is wasted and thrown away?", category: .food, possibleAnswers: WastedFood.possibleAnswers),
        Question(text: "How often do you buy locally produced food?", category: .food, possibleAnswers: LocallyProducedFood.possibleAnswers),
        Question(text: "How would you best describe your diet?", category: .food, possibleAnswers: DietType.possibleAnswers),
        Question(text: "What type of house do you live in", category: .house, possibleAnswers: TypeOfHouse.possibleAnswers),
        Question(text: "How many people live in the house above the age of 18?", category: .house, possibleAnswers: NumberOfHouseHoldMembers.possibleAnswers),
        Question(text: "What temperature do you keep your house at in the winter?", category: .house, possibleAnswers: HouseTempInWinter.possibleAnswers),
        Question(text: "Do you regularly turn off lights and appliances when not used for long periods of time?", category: .house, possibleAnswers: TurnOffLights.possibleAnswers),
        Question(text: "How do you heat your home", category: .house, possibleAnswers: HouseHeatingFuel.possibleAnswers),
        Question(text: "Do you have any of these energy saving improvements in your home?", category: .house, possibleAnswers: EnergySavingImprovement.possibleAnswers),
        Question(text: "Which of the following do you recycle?", category: .house, possibleAnswers: WasteRecycling.possibleAnswers),
        Question(text: "In the last year, how many round trip flights have you made?", category: .travel, possibleAnswers: NumberOfFlight.possibleAnswers),
        Question(text: "What kind of vehicle do you travel in most?", category: .house, possibleAnswers:MostUsedVechile.possibleAnswers),
        Question(text: "How many miles a week do you drive?", category: .house, possibleAnswers: NumberOfDrivesPerWeek.possibleAnswers)
    ]
    
    // FOOD EXTRA QUESTIONS
    //   "Of the food you buy how much is wasted and thrown away?
    //   "How often do you buy locally produced food?"
    
    // TRAVEL EXTRA ANSWER
    // var personalTransportation: PersonalTransportation
    
    
    // MARK: - Calculators(Results)
    // FOOD
    func foodCalculator(for food: Food) -> Double {
        let locallyProducedFood = food.locallyProducedFood.results
        let dietType = food.dietType.results
        let wastedFood = food.wastedFood.results
        
        return dietType - (dietType * locallyProducedFood) + wastedFood
    }
    
    // HOUSE
    func houseCalculator(house: House) -> Double {
        let numberOfHouseholdMembers = house.numberOfHouseHoldMembers.results
        let houseTempInWinter = house.houseTempInWinter.results
        let turnOffLights = house.turnOffLights.results
        let typeOfHouse = house.typeOfHouse.results
        let houseHeatingFuel = house.houseHeatingFuel.results
        let energySavingImprovement = house.energySavingImprovement.results
        let wasteRecycling = house.wasteRecycling.results
        
        let totalHomeEmissions = numberOfHouseholdMembers + typeOfHouse + houseHeatingFuel
        
        return ((totalHomeEmissions) - (totalHomeEmissions * houseTempInWinter)) - (turnOffLights + energySavingImprovement + wasteRecycling)
    }
    
    // TRAVEL
    func travelCalculator(travel: Travel) -> Double {
        let personalTransportation = travel.personalTransportation.results
        let mostUsedVechile = travel.mostUsedVechile.results
        let numberOfFlight = travel.numberOfFlight.results
        let numberOfDrivesPerWeek = travel.numberOfDrivesPerWeek.results
        
        return personalTransportation + mostUsedVechile + numberOfFlight + numberOfDrivesPerWeek
    }
    
    // GREEN
    func greenCalculator(travel: Travel, food: Food, house: House) -> Double {
        let foodCal = foodCalculator(for: food)
        let houseCal = houseCalculator(house: house)
        let travelCal = travelCalculator(travel: travel)
        return houseCal + travelCal + foodCal
    }
}
