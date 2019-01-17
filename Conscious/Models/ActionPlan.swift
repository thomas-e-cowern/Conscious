//
//  ActionPlan.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

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
            return ["Meatless Monday", "Become Vegetarian", "Eat Seasonal", "Buy Local ", "Get a reusable water bottle", "Use reusable grocery bags", "Pack your lunches", "Try out a vegan recipe", "Compost", "Reduce food waste"]
        case .home:
            return ["Adjust your thermostat 2 degrees", "Switch to Energy Efficient Light Bulbs", "Check Your Water Heater","Replace A/C Filters Regularly", "Shorter Showers", "Power Strip It", "Wash Clothes in Cold Water", "Consider Green Power", "Look for the Energy Star", "Recycle", "Switch To Online Billing"]
        case .travel:
            return ["Keep Your Car Breathing", "Tire Pressure", "Walk or Bike", "Idling Less", "Don’t Speed", "Avoid Flying", "Take The Bus", "Carpool"]
        case .stuff:
            return ["Wait To Upgrade", "Thrift Shop", "Avoid Fast Fashion", "Recycle Your Clothes", "Rechargeable Batteries", "Support Eco-Friendly Businesses"]
        }
    }
}
