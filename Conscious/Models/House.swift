//
//  House.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

struct House {
    
    var numberOfHouseHoldMembers: NumberOfHouseHoldMembers
    var houseTempInWinter: HouseTempInWinter
    var turnOffLights: TurnOffLights
    var typeOfHouse: TypeOfHouse
    var houseHeatingFuel: HouseHeatingFuel
    var energySavingImprovement: EnergySavingImprovement
    var wasteRecycling: WasteRecycling
}

// MARK: - Answeres
enum NumberOfHouseHoldMembers: String, Answer  {
    case oneToTwo = "1 or 2 household members"
    case threeToFour = "3 or 4 household members"
    case fiveToSeven = "5 to 7 household members"
    case aboveSeven = "8 or more household members"
    
    var results: Double {
        switch self {
        case .oneToTwo:
            return 2.0
        case .threeToFour:
            return 4.0
        case .fiveToSeven:
            return 7.0
        case .aboveSeven:
            return 10.0
        }
    }
}

extension NumberOfHouseHoldMembers: CaseIterable{
    static var possibleAnswers: [Answer]{
        return NumberOfHouseHoldMembers.allCases
    }
}

enum HouseTempInWinter: String, Answer {
    case cool = "I keep my home cool"
    case warm = "I keep my home warm"
    case hot = "I keep my home hot"
    
    var results: Double {
        switch self {
        case .cool:
            return 0.2
        case .warm:
            return 0.1
        case .hot:
            return -0.2
        }
    }
}

extension HouseTempInWinter: CaseIterable{
    static var possibleAnswers: [Answer]{
        return HouseTempInWinter.allCases
    }
}

enum TurnOffLights: String, Answer {
    case yes = "Yes"
    case no = "No"
    
    var results: Double {
        switch self {
        case .yes:
            return 0.09
        case .no:
            return 0.0
        }
    }
}

extension TurnOffLights: CaseIterable{
    static var possibleAnswers: [Answer]{
        return TurnOffLights.allCases
    }
}

enum TypeOfHouse: String, Answer {
    case apartment = "Apartment"
    case tinyHouse = "Tiny House"
    case house = "House"
    case condo = "Condo"
    
    var results: Double {
        switch self {
        case .apartment:
            return 5.59
        case .tinyHouse:
            return 3.49
        case .house:
            return 6.35
        case .condo:
            return 6.03
        }
    }
}

extension TypeOfHouse: CaseIterable{
    static var possibleAnswers: [Answer]{
        return TypeOfHouse.allCases
    }
}

enum HouseHeatingFuel: String, Answer {
    case gas = "Natural Gas"
    case oil = "Oil"
    case electric = "Electric"
    case wood = "Wood"
    
    var results: Double {
        switch self {
        case .gas:
            return 3.58
        case .oil:
            return 5.65
        case .electric:
            return 6.36
        case .wood:
            return 4.4
        }
    }
}

extension HouseHeatingFuel: CaseIterable{
    static var possibleAnswers: [Answer]{
        return HouseHeatingFuel.allCases
    }
}

// User get to choose more than one answer for this Q
enum EnergySavingImprovement: String, Answer {
    case energySavingLightBulbs = "Energy Saving Lightbulbs"
    case efficientInsullation = "Efficient Insulation"
    case solarPanels = "Solar Panels"
    
    var results: Double {
        switch self {
        case .energySavingLightBulbs:
            return 0.18
        case .efficientInsullation:
            return 1.92
        case .solarPanels:
            return 2.61
        }
    }
}

extension EnergySavingImprovement: CaseIterable{
    static var possibleAnswers: [Answer]{
        return EnergySavingImprovement.allCases
    }
}

// User get to choose more than one answer for this Q
enum WasteRecycling: String, Answer {
    case paper = "Paper"
    case plastic = "Plastic"
    case glass = "Glass"
    case food = "Food"
    
    var results: Double {
        switch self {
        case .paper:
            return 0.04
        case .plastic:
            return 0.09
        case .glass:
            return 0.08
        case . food:
            return 0.67
        }
    }
}

extension WasteRecycling: CaseIterable{
    static var possibleAnswers: [Answer]{
        return WasteRecycling.allCases
    }
}
