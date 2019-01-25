//
//  Alarm.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/21/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation

class Alarm: Equatable, Codable {
    
    var fireDate: Date
    var name: String
    var message: String
    var enabled: Bool
    var repeats: Bool
    var frequency: String
    let uuid: String
    var fireTimeAsString: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .short
            return dateFormatter.string(from: fireDate)
        }
    }
    
    init(fireDate: Date, name: String, message: String, enabled: Bool, frequency: String, repeats: Bool) {
        self.fireDate = fireDate
        self.name = name
        self.message = message
        self.enabled = enabled
        self.repeats = repeats
        self.frequency = frequency
        self.uuid = UUID().uuidString
    }
    
    static func == (lhs: Alarm, rhs: Alarm) -> Bool {
        if lhs.uuid == rhs.uuid { return true }
        return false
    }
}
