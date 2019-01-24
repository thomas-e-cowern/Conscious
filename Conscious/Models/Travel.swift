//
//  Travel.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

struct Travel {
    
    var numberOfFlight: NumberOfFlight
    var numberOfDrivesPerWeek: NumberOfDrivesPerWeek
    var personalTransportation: PersonalTransportation
    var mostUsedVechile: MostUsedVechile
}

// MARK: - Answeres
enum NumberOfFlight: String, Answer {
    var category: EmmissionCategory { return EmmissionCategory.travel }
    
    case oneToTwo = "1 or 2 flights per year"
    case threeToFour = "3 or 4 flights per year"
    case fiveToSeven = "5 to 7 flights per year"
    case aboveSeven = "8 or more flights per year"
    
    var results: Double {
        switch self {
        case .oneToTwo:
            return 2.0 * 0.9
        case .threeToFour:
            return 4.0 * 0.9
        case .fiveToSeven:
            return 7.0 * 0.9
        case .aboveSeven:
            return 10.0 * 0.9
        }
    }
}

extension NumberOfFlight: CaseIterable{
    static var possibleAnswers: [Answer]{
        return NumberOfFlight.allCases
    }
}

enum NumberOfDrivesPerWeek: String, Answer {
    var category: EmmissionCategory { return EmmissionCategory.travel }
    
    case lessThan100Miles = "Less than 100 Miles"
    case between100And200 = "Between 100 and 200"
    case greaterThan200 = "Greater than 200"
    
    var results: Double {
        switch self {
        case .lessThan100Miles:
            return 2.36
        case .between100And200:
            return 4.72
        case .greaterThan200:
            return 6.58
        }
    }
}

extension NumberOfDrivesPerWeek: CaseIterable{
    static var possibleAnswers: [Answer]{
        return NumberOfDrivesPerWeek.allCases
    }
}

// NO QUESTION FOR THIS ANSWER
enum PersonalTransportation: String, Answer {
    var category: EmmissionCategory { return EmmissionCategory.travel }
    
    case car = "Car"
    case motorcycleOrScooter = "Motorcycle / Scooter"
    case none = "None"
    
    var results: Double {
        switch self {
        case .car:
            return 4.6
        case .motorcycleOrScooter:
            return 0.54
        case .none:
            return 0
        }
    }
}

extension PersonalTransportation: CaseIterable{
    static var possibleAnswers: [Answer]{
        return PersonalTransportation.allCases
    }
}

enum MostUsedVechile: String, Answer {
    var category: EmmissionCategory { return EmmissionCategory.travel }
    
    case electricCar = "Electric Car"
    case hybridCar = "Hybrid Car"
    case smallGasCar = "Small Car"
    case mediumGasCar = "Medium Car"
    case largeGasCar = "Large Car"
    case none = "None"
    
    var results: Double {
        switch self {
        case .electricCar:
            return 2.02
        case .hybridCar:
            return 2.77
        case .smallGasCar:
            return 3.46
        case .mediumGasCar:
            return 4.27
        case .largeGasCar:
            return 5.19
        case .none:
            return 0
        }
    }
}

extension MostUsedVechile: CaseIterable{
    static var possibleAnswers: [Answer]{
        return MostUsedVechile.allCases
    }
}
