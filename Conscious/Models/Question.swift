//
//  Question.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

protocol Answer{}

struct Question {
    
    var question: [String]
    var category: [String]
    var answers: [Answer]
}
