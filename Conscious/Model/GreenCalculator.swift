//
//  GreenCalculator.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 16/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

struct GreenCalculator {
    
    // MARK: - Food
    var wastedFood: Double
    
    enum locallyProducedFood {
        case alot
        case some
        case none
        
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
    
    enum dietType {
        case mostlyMeat
        case someMeat
        case rarelyMeat
        case vegetarian
        case vegan
        
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
    
    func foodCalculator(locallyProducedFood: locallyProducedFood, dietType: dietType, wastedFood: Double) -> Double {
        
        let locallyProducedFood = locallyProducedFood.results
        let dietType = dietType.results
        let wastedFood = wastedFood * 315
        
        return locallyProducedFood + dietType + wastedFood
    }
    
    // MARK: - Home
    var numberOfHouseHoldMembers: Int = 1
    var houseTemInWinter: Double
    var turnOffLights: Bool
    
    enum States {
        static var all = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    }
    
    enum homeHeatingFuel {
        case gas
        case oil
        case electric
        case wood
        
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
    
    enum energySavingImprovement {
        case energySavingLightBulbs
        case efficientInsullation
        case solarPanels
        
        var results: Double {
            switch self {
            case .energySavingLightBulbs:
                return 400
            case .efficientInsullation:
                // NEEDS WORK
                return 0
            case .solarPanels:
                return 5760
            }
        }
    }
    
    enum wasteRecycling {
        case paper
        case plastic
        case glass
        case food
        
        var results: Double {
            switch self {
            case .paper:
                return 89
            case .plastic:
                return 205
            case .glass:
                return 189
            case . food:
                // NEEDS WORK
                return 0
            }
        }
    }
    
    enum typeOfHouse {
        case apartment
        case tinyHouse
        case house
        case condo
        
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
    
    // MARK: - Travel
    var numberOfFlight: Int = 0
    
    enum numberOfDrivesPerWeek {
        case lessThan100Miles
        case between100And200
        case greaterThan200
        
        var results: Double {
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
        
        var results: Double {
            switch self {
            case .car:
                return 4.6
            case .motorBike:
                return 0.54
            case .none:
                return 0
            }
        }
    }
    
    enum mostUsedVechile {
        case electricCar
        case hybridCar
        case smallGasCar
        case meduimGasCar
        case largeGasCar
        
        var results: Double {
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
    }
    
    func travelCalculator(personalTransportation: personalTransportation, mostUsedVechile: mostUsedVechile, numberOfFlight: Int, numberOfDrivesPerWeek: numberOfDrivesPerWeek) -> Double {
        
        let personalTransportation = personalTransportation.results
        let mostUsedVechile = mostUsedVechile.results
        let numberOfFlight = Double(numberOfFlight) * 0.9
        let numberOfDrivesPerWeek = numberOfDrivesPerWeek.results
        
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
