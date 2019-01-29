//
//  ActionPlan.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

// MARK: - Properties
var isVegetarian: Bool = false
var buysLocally: Bool = false
var composts: Bool = false
var lowTemp: Bool = false
var lightBulbs: Bool = false
var recycles: Bool = false
var ownsCar: Bool = true
var ridesTheBus: Bool = false

var baseFoodPlan: [ActionPlanDetail] = [eatSeasonal, reusableWaterBottl, reusableGroceryBags, packYourLunch, reduceFoodWaste]

var baseHomePlan: [ActionPlanDetail] = [waterHeaterTemp, replaceAcFilters, shorterShowers, powerStripIt, coldWaterWash, greenPower]

var baseTravelPlan: [ActionPlanDetail] = [walkOrBike, avoidFlying]

struct ActionPlan {
    var text: String
    var type: Categories
}

struct ScoreCard: Codable {
    var foodScore: Double
    var houseScore: Double
    var travelScore: Double
    var stuffScore: Double
}

enum Categories: String {
    case food = "Food", home = "Home", travel = "Travel"
    
    var actionPlan: [ActionPlanDetail] {
        switch self {
        case .food:
            if isVegetarian == false {
                baseFoodPlan += [meatlessModay, becomeVegetarian, tryAVeganRecipe]
            }
            if buysLocally == false {
                baseFoodPlan += [buyLocal]
            }
            if composts == false {
                baseFoodPlan += [compost]
            }
            return baseFoodPlan
        case .home:
            if lowTemp == false {
                baseHomePlan += [thermostatTemps]
            }
            if lightBulbs == false {
                baseHomePlan += [energyEfficientLights]
            }
            if recycles == false {
                baseHomePlan += [recycle]
            }
            return baseHomePlan
        case .travel:
            if ownsCar == true {
                baseTravelPlan += [checkYourSpeed, keepYourCarBreathing, tirePressure, reduceIdling, carpool]
            }
            if ridesTheBus == false {
                baseTravelPlan += [takeTheBus]
            }
            return baseTravelPlan
        }
    }
}
