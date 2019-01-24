//
//  Food.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

struct Food {
    
    var wastedFood: WastedFood
    var locallyProducedFood: LocallyProducedFood
    var dietType: DietType
    var thrownFood: ThrownFood
}

 // MARK: - Answeres
enum WastedFood: String, Answer {
    var category: EmmissionCategory { return EmmissionCategory.food }
    
    case none = "None"
    case lessThan10Percent = "0% to 10%"
    case between10and30Percent = "11% to 30%"
    case over30Percent = "More than 30%"
    
    var results: Double {
        switch self {
        case .none:
            return 0.0
        case .lessThan10Percent:
            return 0.1 * 315
        case .between10and30Percent:
            return 0.3 * 315
        case .over30Percent:
            return 0.5 * 315
        }
    }
}

extension WastedFood: CaseIterable{
    static var possibleAnswers: [Answer]{
        return WastedFood.allCases
    }
}

enum LocallyProducedFood: String, Answer {
    var category: EmmissionCategory { return EmmissionCategory.food }
    
    case alot = "A lot of the food I buy is locally sourced"
    case some = "Some of the food I buy is locally sourced"
    case none = "Local sourcing isn’t a top priority for me"
    
    var results: Double {
        switch self {
        case .alot:
            return 0.25
        case .some:
            return 0.15
        case .none:
            return 0
        }
    }
}

extension LocallyProducedFood: CaseIterable{
    static var possibleAnswers: [Answer]{
        return LocallyProducedFood.allCases
    }
}

enum DietType: String, Answer {
    var category: EmmissionCategory { return EmmissionCategory.food }
    
    case mostlyMeat = "Meat in most meals"
    case someMeat = "Meat in some meals"
    case rarelyMeat = "Meat very rarely / just fish"
    case vegetarian = "Vegetarian"
    case vegan = "Vegan"
    
    var results: Double {
        switch self {
        case .mostlyMeat:
            return 2.99
        case .someMeat:
            return 2.27
        case .rarelyMeat:
            return 1.72
        case .vegetarian:
            return 1.54
        case .vegan:
            return 1.36
        }
    }
}

extension DietType: CaseIterable {
    static var possibleAnswers: [Answer] {
        return DietType.allCases
    }
}

enum ThrownFood: String, Answer {
    var category: EmmissionCategory { return EmmissionCategory.food }
    
    case zeroToTen = "0% - 10%"
    case tenToThirty = "10% - 30%"
    case moreThanThirty = "More than 30%"
    
    var results: Double {
        switch self {
        case .zeroToTen:
            return 0.014
        case .tenToThirty:
            return 0.039
        case .moreThanThirty:
            return 0.056
        }
    }
}

extension ThrownFood: CaseIterable {
    static var possibleAnswers: [Answer] {
        return ThrownFood.allCases
    }
}


enum FoodQuesitons{
    case wastedFood(WastedFood)
    case locallyProducedFood(LocallyProducedFood)
    case dietType(DietType)
    case thrownFood(ThrownFood)
}
