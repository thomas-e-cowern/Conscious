//
//  ActionPlanController.swift
//  Conscious
//
//  Created by Hanadi AlOthman on 17/01/2019.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

class ActionPlanController {
    
    static let shared = ActionPlanController()
    
    let foodActions: [ActionPlanDetail] = Categories.food.actionPlan
    let homeActions: [ActionPlanDetail] = Categories.home.actionPlan
    let travelActions: [ActionPlanDetail] = Categories.travel.actionPlan
    
    var userActionList: [String] = []
    
    var actionsComplete: Int = 0
    
    
    
}


