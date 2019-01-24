//
//  ActionPlan.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

// MARK: - Properties
let isVegHead: Bool = false
let buysLocally: Bool = false
let composts: Bool = false
let lowTemp: Bool = false
let lightBulbs: Bool = false
let recycles: Bool = false
let ownsCar: Bool = true
let ridesTheBus: Bool = false

var baseFoodPlan: [ActionPlanDetail] = [eatSeasonal, reusableWaterBottl, reusableGroceryBags, packYourLunch, reduceFoodWaste]

var baseHomePlan: [ActionPlanDetail] = [waterHeaterTemp, replaceAcFilters, shorterShowers, powerStripIt, coldWaterWash, greenPower]

var baseTravelPlan: [ActionPlanDetail] = [walkOrBike, avoidFlying]

struct ActionPlan {
    var text: String
    var type: Categories
}

struct ScoreCard {
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
            if isVegHead == false {
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
