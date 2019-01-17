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
    var wastedFood: WastedFood
    var locallyProducedFood: LocallyProducedFood
    var dietType: DietType
    
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
    
    func foodCalculator() -> Double {
        
        let locallyProducedFood = self.locallyProducedFood.results
        let dietType = self.dietType.results
        let wastedFood = self.wastedFood.results
        
        return dietType - (dietType * locallyProducedFood) + wastedFood
    }
    
    // MARK: - Home
    var numberOfHouseHoldMembers: NumberOfHouseHoldMembers
    var houseTempInWinter: HouseTempInWinter
    var turnOffLights: TurnOffLights
    var typeOfHouse: TypeOfHouse
    var homeHeatingFuel: HomeHeatingFuel
    var energySavingImprovement: EnergySavingImprovement
    var wasteRecycling: WasteRecycling
    
    enum States {
        static var all = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    }
    
    enum NumberOfHouseHoldMembers: String, Answer  {
        case oneToTwo = "1 or 2 household members"
        case threeToFour = "3 or 4 household members"
        case fiveToSeven = "5 to 7 household members"
        case aboveSeven = "8 or more household members"
        
        var results: Double {
            switch self {
            case .oneToTwo:
                return 2.0
            case .threeToFour:
                return 4.0
            case .fiveToSeven:
                return 7.0
            case .aboveSeven:
                return 10.0
            }
        }
    }
    
    enum HouseTempInWinter: String, Answer {
        case cool = "I keep my home cool"
        case warm = "I keep my home warm"
        case hot = "I keep my home hot"
        
        var results: Double {
            switch self {
            case .cool:
                return 0.2
            case .warm:
                return 0.1
            case .hot:
                return -0.2
            }
        }
    }
    
    enum TurnOffLights: String, Answer {
        case yes = "Yes"
        case no = "No"
        
        var results: Double {
            switch self {
            case .yes:
                return 0.09
            case .no:
                return 0.0
            }
        }
    }
    
    enum TypeOfHouse: String, Answer {
        case apartment = "Apartment"
        case tinyHouse = "Tiny House"
        case house = "House"
        case condo = "Condo"
        
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
    
    enum HomeHeatingFuel: String, Answer {
        case gas = "Natural Gas"
        case oil = "Oil"
        case electric = "Electric"
        case wood = "Wood"
        
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
    
    enum EnergySavingImprovement: String, Answer {
        case energySavingLightBulbs = "Energy Saving Lightbulbs"
        case efficientInsullation = "Efficient Insulation"
        case solarPanels = "Solar Panels"
        
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
    
    enum WasteRecycling: String, Answer {
        case paper = "Paper"
        case plastic = "Plastic"
        case glass = "Glass"
        case food = "Food"
        
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
        let numberOfHouseholdMembers = self.numberOfHouseHoldMembers.results
        let houseTempInWinter = self.houseTempInWinter.results
        let turnOffLights = self.turnOffLights.results
        let typeOfHouse = self.typeOfHouse.results
        let homeHeatingFuel = self.homeHeatingFuel.results
        let energySavingImprovement = self.energySavingImprovement.results
        let wasteRecycling = self.wasteRecycling.results
        
        let totalHomeEmissions = numberOfHouseholdMembers + typeOfHouse + homeHeatingFuel
        
        return ((totalHomeEmissions) - (totalHomeEmissions * houseTempInWinter)) - (turnOffLights + energySavingImprovement + wasteRecycling)
    }
    
    // MARK: - Travel
    var numberOfFlight: NumberOfFlight
    var numberOfDrivesPerWeek: NumberOfDrivesPerWeek
    var personalTransportation: PersonalTransportation
    var mostUsedVechile: MostUsedVechile
    
    enum NumberOfFlight: String, Answer {
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
        let numberOfFlight = self.numberOfFlight.results
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
