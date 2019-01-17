//
//  House.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

struct House {
    
    var numberOfHouseHoldMembers: NumberOfHouseHoldMembers
    var houseTempInWinter: HouseTempInWinter
    var turnOffLights: TurnOffLights
    var typeOfHouse: TypeOfHouse
    var houseHeatingFuel: HouseHeatingFuel
    var energySavingImprovement: EnergySavingImprovement
    var wasteRecycling: WasteRecycling
    
    let answersArray = [NumberOfHouseHoldMembers.self, HouseTempInWinter.self, TurnOffLights.self, TypeOfHouse.self, HouseHeatingFuel.self, EnergySavingImprovement.self, WasteRecycling.self] as [Any]
    
    // MARK: - Questions
    let householdQuestions = [" How many people live in the house above the age of 18?", "What temperature do you keep your house at in the winter?", "Do you regularly turn off lights and appliances when not used for long periods of time?", "What type of house do you live in?", "How do you heat your home", "Do you have any of these energy saving improvements in your home?", "Which of the following do you recycle?"]
    
    enum States {
        static var all = ["AK", "AL", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY"]
    }
    
    // MARK: - Answeres
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
    
    enum HouseHeatingFuel: String, Answer {
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
}
