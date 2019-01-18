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
}

 // MARK: - Answeres
enum WastedFood: String, Answer {
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

enum LocallyProducedFood: String, Answer {
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

enum DietType: String, Answer {
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
