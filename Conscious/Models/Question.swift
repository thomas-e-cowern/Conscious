//
//  Question.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

protocol Answer{
    var rawValue: String { get }
    var category: EmmissionCategory { get }
    var results: Double { get }
}

extension Answer{
    func index(in answers: [Answer]) -> Int?{
        for (index, object) in answers.enumerated(){
            if object.rawValue == self.rawValue{
                return index
            }
        }
        return nil
    }
}

class Question {
    var text: String
    var category: EmmissionCategory
    var possibleAnswers: [Answer]
    var selectedAnswers: [Answer] = []
    let questionType: QuestionType
    
    init(text: String, category: EmmissionCategory, possibleAnswers: [Answer], questionType: QuestionType){
        self.text = text
        self.category = category
        self.possibleAnswers = possibleAnswers
        self.questionType = questionType
    }
}

enum EmmissionCategory: String {
    case food = "Food"
    case house = "House"
    case travel = "Travel"
}

enum QuestionType{
    case mutuallyExclusive
    case multipleAnswer
}

//TEST
