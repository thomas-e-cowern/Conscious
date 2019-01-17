//
//  Travel.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

struct Travel {
    
    var numberOfFlight: NumberOfFlight
    var numberOfDrivesPerWeek: NumberOfDrivesPerWeek
    var personalTransportation: PersonalTransportation
    var mostUsedVechile: MostUsedVechile
    
    let answersArray = [NumberOfFlight.self, NumberOfDrivesPerWeek.self, PersonalTransportation.self, MostUsedVechile.self] as [Any]
    
    // MARK: - Questions
    var travelQuestions = ["In the last year, how many round trip flights have you made?", "How many miles a week do you drive", "What kind of vehicle do you travel in most?", "What kind of vehicle do you travel in most?"]
    
    // MARK: - Answeres
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
}
