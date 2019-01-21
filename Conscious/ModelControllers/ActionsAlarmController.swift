//
//  ActionsAlarmController.swift
//  Conscious
//
//  Created by Thomas Cowern New on 1/21/19.
//  Copyright © 2019 Thomas Cowern New. All rights reserved.
//

import Foundation
import UserNotifications


protocol AlarmScheduler: class {
    func scheduleUserNotifications(for: Alarm)
}

class AlarmController: AlarmScheduler {
    
    static let shared = AlarmController()
    
    var alarms: [Alarm] = []
    
    func addAlarm(fireDate: Date, name: String, enabled: Bool, repeats: Bool) {
        let newAlarm = Alarm(fireDate: fireDate, name: name, enabled: enabled, repeats: repeats)
        alarms.append(newAlarm)
//        saveToPersistentStore()
    }
    
//    func fileURL() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let documentsDirectory = paths[0]
//        let fileName = "alarms.json"
//        let fullURL = documentsDirectory.appendingPathComponent(fileName)
//
//        print(fullURL)
//
//        return(fullURL)
//    }
    
//    func saveToPersistentStore() {
//        let encoder = JSONEncoder()
//        do {
//            let data = try encoder.encode(self.alarms)
//            try data.write(to: fileURL())
//        } catch {
//            print("Error: \(#function): \(error) : \(error.localizedDescription)")
//        }
//    }
//
//    func loadFromPersistenceStore() -> [Alarm] {
//        do {
//            let data = try Data(contentsOf: fileURL())
//            let decoder = JSONDecoder()
//            let alarms = try decoder.decode([Alarm].self, from: data)
//            return alarms
//        } catch  {
//            print("Error: \(#function): \(error) : \(error.localizedDescription)")
//        }
//
//        return []
//    }
    
}

extension AlarmScheduler {
    func scheduleUserNotifications(for alarm: Alarm) {
        let content = UNMutableNotificationContent()
        content.title = "This is a test title"
        content.body = "Your Timer is Done! On a side note, I can't begin to explain my hatred for how contraints work and how pointless it seems to be to understand them.  The reason this app looks like shit is because I don't know how to make it look better.   Take another look.... I rest my case...."
        content.sound = UNNotificationSound.default

        let fireDate = alarm.fireDate
        let dateComponents = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: fireDate)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)

        let request = UNNotificationRequest(identifier: alarm.uuid, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("😡There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
            }
        }
    }

    func cancelUserNotifications(for alarm: Alarm) {
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [alarm.uuid])
    }
}

