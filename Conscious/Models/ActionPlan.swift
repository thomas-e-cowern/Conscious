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
let ownsCar: Bool = false
let ridesTheBus: Bool = true

var baseFoodPlan: [String] = ["Eat Seasonal", "Get a reusable water bottle", "Use reusable grocery bags", "Pack your lunches"]

var baseHomePlan: [String] = ["Check Your Water Heater","Replace A/C Filters Regularly", "Shorter Showers", "Power Strip It", "Wash Clothes in Cold Water", "Consider Green Power", "Look for the Energy Star", "Switch To Online Billing"]

var baseTravelPlan: [String] = ["Walk or Bike", "Avoid Flying"]

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
    case food = "Food", home = "Home", travel = "Travel", stuff = "Stuff"
    
    var actionPlan: [String] {
        switch self {
        case .food:
            if isVegHead == false {
                baseFoodPlan += ["Meatless Monday", "Become Vegetarian", "Try out a vegan recipe"]
            }
            if buysLocally == false {
                baseFoodPlan += ["Buy Local"]
            }
            if composts == false {
                baseFoodPlan += ["Compost"]
            }
            return baseFoodPlan
        case .home:
            if lowTemp == false {
                baseHomePlan += ["Adjust your thermostat 2 degrees"]
            }
            if lightBulbs == false {
                baseHomePlan += ["Switch to Energy Efficient Light Bulbs"]
            }
            if recycles == false {
                baseHomePlan += ["Recycle"]
            }
            return baseHomePlan
        case .travel:
            if ownsCar == true {
                baseTravelPlan += ["Keep Your Car Breathing", "Tire Pressure", "Idling Less", "Don’t Speed", "Carpool"]
            }
            if ridesTheBus == false {
                baseTravelPlan += ["Take The Bus"]
            }
            return baseTravelPlan
        case .stuff:
            return ["Wait To Upgrade", "Thrift Shop", "Avoid Fast Fashion", "Recycle Your Clothes", "Rechargeable Batteries", "Support Eco-Friendly Businesses"]
        }
    }
}
