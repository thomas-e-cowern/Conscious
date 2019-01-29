//
//  SavedData.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/26/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

struct SavedData: Codable, Equatable {
    
    // Properties
    let overallScore: Double
    let foodScore: Double
    let houseScore: Double
    let travelScore:   Double
    
    // Initializer
    init(overallScore: Double, foodScore: Double, houseScore: Double, travelScore: Double) {
        self.overallScore = overallScore
        self.foodScore = foodScore
        self.houseScore = houseScore
        self.travelScore = travelScore

    }
    
    // MARK: - equatable
    static func == (lhs: SavedData, rhs: SavedData) -> Bool {
        if lhs.overallScore == rhs.overallScore &&
        lhs.foodScore == rhs.foodScore &&
        lhs.houseScore == rhs.houseScore &&
        lhs.travelScore == rhs.travelScore  {
            return true
        } else {
            return false
        }
    }
}
