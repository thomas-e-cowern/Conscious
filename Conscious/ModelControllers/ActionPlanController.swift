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
    
    var userActionList: [ActionPlanDetail] = []
    
    var actionsComplete: [ActionPlanDetail] = []
    
    var reductionInCo2: Double = 0.0
    var reductionInCost: Double = 0.0
    
    var savedData: [SavedData] = []
    
    var savedActions: [ActionPlanDetail] = []
    
    var savedDate: [SavedDate] = []
    
    func addNewResults(overallScore: Double, foodScore: Double, houseScore: Double, travelScore: Double) {
        savedData = loadFromPersistenceStore(path: "data")
        let newResults = SavedData(overallScore: overallScore, foodScore: foodScore, houseScore: houseScore, travelScore: travelScore)
        savedData.append(newResults)
        print("💔💔💔💔💔💔💔\(savedData)💔💔💔💔💔💔💔💔")
        ActionPlanController.shared.saveToPersistentStoreData(path: "data")
    }
    
    func addNewActions(action: ActionPlanDetail) {
//        print("🧸🧸🧸🧸🧸\(action)🧸🧸🧸🧸🧸")
        let newAction = action
        savedActions.append(newAction)
        print("🎈🎈🎈🎈🎈\(savedActions[0].added)🎈🎈🎈🎈🎈")
        ActionPlanController.shared.saveToPersistentStoreData(path: "action")
    }
    
    func saveActions(actions: [ActionPlanDetail]) {
        savedActions = actions
//        print("🎈🎈🎈🎈🎈\(savedActions[0].completed)🎈🎈🎈🎈🎈")
        ActionPlanController.shared.saveToPersistentStoreData(path: "action")
    }
    
    func deleteAction(index: Int?) {
        guard let index = index else { return }
        print("ID: \(index)")
        savedActions.remove(at: index)
        print("deleted")
        ActionPlanController.shared.saveToPersistentStoreData(path: "action")
    }
    
    func saveDate(date: SavedDate) {
        print("Saved Date")
        savedDate.append(date)
        print(savedDate)
        ActionPlanController.shared.saveToPersistentStoreData(path: "savedDate")
    }
    
    // Saving data
    func fileURL(path: String) -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        let fileName = "\(path).json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        
        print(fullURL)
        
        return(fullURL)
    }
    
    func saveToPersistentStoreData(path: String) {
        let encoder = JSONEncoder()
        if path == "data" {
            do {
                let data = try encoder.encode(self.savedData)
                try data.write(to: fileURL(path: path))
            } catch {
                print("☎️☎️☎️☎️☎️Error: \(#function): \(error) : \(error.localizedDescription)☎️☎️☎️☎️☎️")
            }
        } else if path == "action"{
            do {
                let data = try encoder.encode(self.savedActions)
                try data.write(to: fileURL(path: path))
            } catch {
                print("☎️☎️☎️☎️☎️Error: \(#function): \(error) : \(error.localizedDescription)☎️☎️☎️☎️☎️")
            }
        } else {
            do {
                let data = try encoder.encode(self.savedDate)
                try data.write(to: fileURL(path: path))
            } catch {
                print("☎️☎️☎️☎️☎️Error: \(#function): \(error) : \(error.localizedDescription)☎️☎️☎️☎️☎️")
            }
        }
    }
    
    func loadFromPersistenceStore<T: Codable>(path: String) -> [T] {
        do {
            let data = try Data(contentsOf: fileURL(path: path))
            
            let decoder = JSONDecoder()
            let returnData = try decoder.decode([T].self, from: data)
            
            if T.self == SavedData.self{
                savedData = returnData as! [SavedData]
            }else if T.self == ActionPlanDetail.self{
                savedActions = returnData as! [ActionPlanDetail]
            }else {
                savedDate = returnData as! [SavedDate]
            }
            return returnData
        } catch  {
            print("🔥🔥🔥🔥🔥Error: \(#function): \(error) : \(error.localizedDescription)🔥🔥🔥🔥🔥")
        }
        
        return []
    }
}


