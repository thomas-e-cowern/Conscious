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
    var locallyProducedFood: LocallyProducedFood
    var dietType: DietType
    
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
    
    func foodCalculator() -> Double {
        
        let locallyProducedFood = self.locallyProducedFood.results
        let dietType = self.dietType.results
        let wastedFood = self.wastedFood * 315
        
        return dietType - (dietType * locallyProducedFood) + wastedFood
    }
    
    // MARK: - Home
    var numberOfHouseHoldMembers: Int = 1
    var houseTemInWinter: Double
    var turnOffLights: Bool
    var typeOfHouse: TypeOfHouse
    var homeHeatingFuel: HomeHeatingFuel
    var energySavingImprovement: EnergySavingImprovement
    var wasteRecycling: WasteRecycling
    
    enum States {
        static var all = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    }
    
    enum TypeOfHouse {
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
    
    enum HomeHeatingFuel {
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
    
    enum EnergySavingImprovement {
        case energySavingLightBulbs
        case efficientInsullation
        case solarPanels
        
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
    
    enum WasteRecycling {
        case paper
        case plastic
        case glass
        case food
        
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
    
    func houseCalculator() -> Double {
        
        let typeOfHouse = self.typeOfHouse.results
        let homeHeatingFuel = self.homeHeatingFuel.results
        let energySavingImprovement = self.energySavingImprovement.results
        let wasteRecycling = self.wasteRecycling.results
        
        return (typeOfHouse + homeHeatingFuel) - (energySavingImprovement + wasteRecycling)
    }
    
    // MARK: - Travel
    var numberOfFlight: Int = 0
    var numberOfDrivesPerWeek: NumberOfDrivesPerWeek
    var personalTransportation: PersonalTransportation
    var mostUsedVechile: MostUsedVechile
    
    enum NumberOfDrivesPerWeek {
        case lessThan100Miles
        case between100And200
        case greaterThan200
        
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
    
    enum PersonalTransportation {
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
    
    enum MostUsedVechile {
        case electricCar
        case hybridCar
        case smallGasCar
        case meduimGasCar
        case largeGasCar
        
        var results: Double {
            switch self {
            case .electricCar:
                return 2.02
            case .hybridCar:
                return 2.77
            case .smallGasCar:
                return 3.46
            case .meduimGasCar:
                return 4.27
            case .largeGasCar:
                return 5.19
            }
        }
    }
    
    func travelCalculator() -> Double {
        
        let personalTransportation = self.personalTransportation.results
        let mostUsedVechile = self.mostUsedVechile.results
        let numberOfFlight = Double(self.numberOfFlight) * 0.9
        let numberOfDrivesPerWeek = self.numberOfDrivesPerWeek.results
        
        return personalTransportation + mostUsedVechile + numberOfFlight + numberOfDrivesPerWeek
    }
    
    // MARK: - Stuff
    enum BuyClothes {
        case week
        case month
        case halfYear
        case Year
    }
    
    enum PurchasedItems {
        case TV
        case Computer
        case appliances
        case furniture
    }
}

extension GreenCalculator {
    
    func greenCalculator() -> Double {
        let houseCal = houseCalculator()
        let travelCal = travelCalculator()
        let foodCal = foodCalculator()
        return houseCal + travelCal + foodCal
    }
    
//    let greenCal = GreenCalculator(wastedFood: <#T##Double#>, locallyProducedFood: <#T##GreenCalculator.LocallyProducedFood#>, dietType: <#T##GreenCalculator.DietType#>, numberOfHouseHoldMembers: <#T##Int#>, houseTemInWinter: <#T##Double#>, turnOffLights: <#T##Bool#>, typeOfHouse: <#T##GreenCalculator.TypeOfHouse#>, homeHeatingFuel: <#T##GreenCalculator.HomeHeatingFuel#>, energySavingImprovement: <#T##GreenCalculator.EnergySavingImprovement#>, wasteRecycling: <#T##GreenCalculator.WasteRecycling#>, numberOfFlight: <#T##Int#>, numberOfDrivesPerWeek: <#T##GreenCalculator.NumberOfDrivesPerWeek#>, personalTransportation: <#T##GreenCalculator.PersonalTransportation#>, mostUsedVechile: <#T##GreenCalculator.MostUsedVechile#>)
}

protocol Answer: CaseIterable {}
