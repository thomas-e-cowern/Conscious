//
//  Question.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

protocol Answer{
    static var possibleAnswers: [Answer] { get }
}

struct Question {
    var text: String
    var category: EmmissionCategory
    var possibleAnswers: [Answer]
}

enum EmmissionCategory: String{
    case food = "Food"
    case house = "House"
    case travel = "Travel"
}
