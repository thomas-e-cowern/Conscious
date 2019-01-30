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
//    
//    func addNewResults(overallScore: Double, foodScore: Double, houseScore: Double, travelScore: Double) {
//        let newResults = SavedData(overallScore: overallScore, foodScore: foodScore, houseScore: houseScore, travelScore: travelScore)
//        savedData.append(newResults)
//        self.saveToPersistentStoreData(path: "data")
//    }
//    
//    func addNewActions(action: ActionPlanDetail) {
//        print("🧸🧸🧸🧸🧸\(action)🧸🧸🧸🧸🧸")
//        let newAction = action
//        savedActions.append(newAction)
//        print("🎈🎈🎈🎈🎈\(savedActions)🎈🎈🎈🎈🎈")
//        self.saveToPersistentStoreData(path: "action")
//    }
//    
//    func saveActions(actions: [ActionPlanDetail]) {
//        savedActions = actions
//        print("🎈🎈🎈🎈🎈\(savedActions[0].completed)🎈🎈🎈🎈🎈")
//        self.saveToPersistentStoreData(path: "action")
//    }
//    
//    func deleteAction(index: Int?) {
//        guard let index = index else { return }
//        print("ID: \(index)")
//        savedActions.remove(at: index)
//        print("deleted")
//        self.saveToPersistentStoreData(path: "action")
//    }
    
//    // Saving data
//    func fileURL(path: String) -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let documentsDirectory = paths[0]
//        let fileName = "\(path).json"
//        let fullURL = documentsDirectory.appendingPathComponent(fileName)
//        
//        print(fullURL)
//        
//        return(fullURL)
//    }
//    
//    func saveToPersistentStoreData(path: String) {
//        let encoder = JSONEncoder()
//        if path == "data" {
//            do {
//                let data = try encoder.encode(self.savedData)
//                try data.write(to: fileURL(path: path))
//            } catch {
//                print("☎️☎️☎️☎️☎️Error: \(#function): \(error) : \(error.localizedDescription)☎️☎️☎️☎️☎️")
//            }
//        } else {
//            do {
//                let data = try encoder.encode(self.savedActions)
//                try data.write(to: fileURL(path: path))
//            } catch {
//                print("☎️☎️☎️☎️☎️Error: \(#function): \(error) : \(error.localizedDescription)☎️☎️☎️☎️☎️")
//            }
//        }
////        do {
////            let data = try encoder.encode(self.savedData)
////            try data.write(to: fileURL(path: path))
////        } catch {
////            print("☎️☎️☎️☎️☎️Error: \(#function): \(error) : \(error.localizedDescription)☎️☎️☎️☎️☎️")
////        }
//    }
//    
//    func loadFromPersistenceStore<T: Codable>(path: String) -> [T] {
//        do {
//            let data = try Data(contentsOf: fileURL(path: path))
//            
//            let decoder = JSONDecoder()
//            let returnData = try decoder.decode([T].self, from: data)
//            
//            if T.self == SavedData.self{
//                savedData = returnData as! [SavedData]
//            }else{
//                savedActions = returnData as! [ActionPlanDetail]
//            }
//            return returnData
//        } catch  {
//            print("🔥🔥🔥🔥🔥Error: \(#function): \(error) : \(error.localizedDescription)🔥🔥🔥🔥🔥")
//        }
//        
//        return []
//    }
}
