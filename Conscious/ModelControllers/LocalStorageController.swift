//
//  LocalStorageController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/25/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

class LocalStorageController {
    
    static let shared = LocalStorageController()
    
    var isNewQuiz: Bool = false
    
    var savedData: [SavedData] = []
    
    var savedActions: [ActionPlanDetail] = []
    
    func addNewResults(overallScore: Double, foodScore: Double, houseScore: Double, travelScore: Double) {
        let newResults = SavedData(overallScore: overallScore, foodScore: foodScore, houseScore: houseScore, travelScore: travelScore)
        savedData.append(newResults)
        self.saveToPersistentStoreData(path: "data")
    }
    
    func addNewActions(action: ActionPlanDetail) {
        let newAction = action
        savedActions.append(newAction)
        self.saveToPersistentStoreData(path: "action")
    }
    
    func updateActionStatus(action: ActionPlanDetail, completed: Bool) {
//        var savedActions = loadFromPersistenceStoreData(path: "actions")
//        print("\(savedActions.count)")
//        for i in 0..<savedActions.count {
//            if savedActions[i].action == action.action {
//                print("🧢🧢🧢🧢🧢🧢🧢🧢Matching🧢🧢🧢🧢🧢🧢🧢🧢🧢")
//                savedActions[i].completed = completed
//            }
//        }
//        self.saveToPersistentStoreData(path: "actions")
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
        } else {
            do {
                let data = try encoder.encode(self.savedActions)
                try data.write(to: fileURL(path: path))
            } catch {
                print("☎️☎️☎️☎️☎️Error: \(#function): \(error) : \(error.localizedDescription)☎️☎️☎️☎️☎️")
            }
        }
//        do {
//            let data = try encoder.encode(self.savedData)
//            try data.write(to: fileURL(path: path))
//        } catch {
//            print("☎️☎️☎️☎️☎️Error: \(#function): \(error) : \(error.localizedDescription)☎️☎️☎️☎️☎️")
//        }
    }
    
    func loadFromPersistenceStore<T: Codable>(path: String) -> [T] {
        do {
            let data = try Data(contentsOf: fileURL(path: path))
            
            let decoder = JSONDecoder()
            let returnData = try decoder.decode([T].self, from: data)
            print("🧿🧿🧿🧿🧿returnData: \(returnData)🧿🧿🧿🧿🧿")
            if T.self == SavedData.self{
                savedData = returnData as! [SavedData]
            }else{
                savedActions = returnData as! [ActionPlanDetail]
            }
            return returnData
        } catch  {
            print("🔥🔥🔥🔥🔥Error: \(#function): \(error) : \(error.localizedDescription)🔥🔥🔥🔥🔥")
        }
        
        return []
    }
}
