//
//  Calculator.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 15/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import UIKit

struct Calculator {
    
    // MARK: - Food
    var wastedFood: Double
    
    enum locallyProducedFood {
        case alot
        case some
        case none
        
        var emmissions: Double {
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
    
    enum dietType {
        case mostlyMeat
        case someMeat
        case rarelyMeat
        case vegetarian
        case vegan
        
        var emmissions: Double {
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
    
    func foodCalculator(locallyProducedFood: locallyProducedFood, dietType: dietType, wastedFood: Double) -> Double {
        
        let locallyProducedFood = locallyProducedFood.emmissions
        let dietType = dietType.emmissions
        let wastedFood = wastedFood * 315
        
        return locallyProducedFood + dietType + wastedFood
        
    }
    
    // MARK: - Home
    var numberOfHouseHoldMembers: Int = 1
    var houseTemInWinter: Double
    var turnOffLights: Bool
    
    enum homeHeatingFuel {
        case gas
        case oil
        case electric
        case wood
    }
    
    enum States {
        static var all = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    }
    
    enum energySavingInprovment {
        case energySavingLightBulbs
        case efficientInsullation
        case solarPanels
    }
    
    enum wasteRecycling {
        case paper
        case plastic
        case glass
        case food
    }
    
    enum typeOfHouse {
        case apartment
        case tinyHouse
        case house
        case condo
    }
    
    // MARK: - Travel
    var numberOfFlight: Int = 0
    
    enum numberOfDrivesPerWeek {
        case lessThan100Miles
        case between100And200
        case greaterThan200
        
        var emmissions: Double {
            switch self {
            case .lessThan100Miles:
                return 5200
            case .between100And200:
                return 10400
            case .greaterThan200:
                return 14500
            }
        }
    }
    
    
    enum personalTransportation {
        case car
        case motorBike
        case none
        
        var emmissions: Double {
            switch self {
            case .car:
                return 4.6
            case .motorBike:
                return 0.54
            case .none:
                return 0
            }
        }
        
        enum mostUsedVechile {
            case electricCar
            case hybridCar
            case smallGasCar
            case meduimGasCar
            case largeGasCar
            
            var emmissions: Double {
                switch self {
                case .electricCar:
                    return 4453.0
                case .hybridCar:
                    return 6108.0
                case .smallGasCar:
                    return 7627.0
                case .meduimGasCar:
                    return 9421.0
                case .largeGasCar:
                    return 11435.0
                }
        }
        
            func travelCalculator(personalTransportation: personalTransportation, mostUsedVechile: mostUsedVechile, numberOfFlight: Int, numberOfDrivesPerWeek: numberOfDrivesPerWeek) -> Double {
                
                let personalTransportation = personalTransportation.emmissions
                let mostUsedVechile = mostUsedVechile.emmissions
                let numberOfFlight = Double(numberOfFlight) * 0.9
                let numberOfDrivesPerWeek = numberOfDrivesPerWeek.emmissions
                
                return personalTransportation + mostUsedVechile + numberOfFlight + numberOfDrivesPerWeek
        }
        
        // MARK: - Stuff
        enum BuyClothes {
            case week
            case month
            case halfYear
            case Year
            
            }
        
        enum purchasedItems {
            case TV
            case Computer
            case appliances
            case furniture
        }
}

//        var emmisions: Double{
//            return 4.5
//
//    struct Emmission{
//        var metricTons: Double
//        var color: UIColor
//    }
//
//    enum DriveAnswer{
//        case hybrid
//        case truck
//        case sedan
//        case noCar
//
//        var emmissions: Double{
//            switch self {
//            case .hybrid:
//                return 1.00
//            case .truck:
//                return 3.5
//            case .sedan:
//                return 2.0
//            case .noCar:
//                return 0.1
//            }
//        }
//    }
//
//    enum BuyClothesAnswer{
//        case weekly
//        case monthly
//        case yearly
//
//        var emmisions: Double{
//            return 4.5
//        }
//    }
//
//    var numberOfTimesDrivingAWeek: Int = 4
//
//    func driveMultiplierX(numberOfTimesPerWeek: Int) -> Double{
//        return Double(numberOfTimesPerWeek) / 5.0
//    }
//    



}
}
