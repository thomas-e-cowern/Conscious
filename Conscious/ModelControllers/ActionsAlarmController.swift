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

class ActionsAlarmController: AlarmScheduler {
    
    static let shared = ActionsAlarmController()
    
    var alarms: [Alarm] = []
    
    func addAlarm(fireDate: Date, name: String, message: String, enabled: Bool, repeats: Bool) {
        let date = Date(timeIntervalSinceNow: 120)
        let newAlarm = Alarm(fireDate: date, name: name, message: message, enabled: enabled, repeats: repeats)
        scheduleUserNotifications(for: newAlarm)
        alarms.append(newAlarm)
        print("Hit addAlarm")
        print(alarms[0].fireDate)
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
        print("Inside AlarmSheduler")
        let content = UNMutableNotificationContent()
        let center = UNUserNotificationCenter.current()
        content.title = alarm.name
        content.body = alarm.message
        content.sound = UNNotificationSound.default
        
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        center.requestAuthorization(options: options) { (allowed, error) in
            if !allowed {
                print("Notification authorization declined")
            }
        }
        
        let fireDate = alarm.fireDate
//        let dateComponentsTwiceAYear = Calendar.current.dateComponents([.month, .day, .hour, .minute], from: fireDate)
//        let dateComponentsMonthly = Calendar.current.dateComponents([.month, .day, .hour, .minute], from: fireDate)
//        let dateComponentsTwiceAMonth = Calendar.current.dateComponents([.weekday, .day, .hour,. minute], from: fireDate)
//        let dateComponentsWeekly = Calendar.current.dateComponents([.weekday, .day, .hour, .minute], from: fireDate)
        let dateComponentsMinute = Calendar.current.dateComponents([.minute, .second], from: fireDate)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponentsMinute, repeats: true)
        let request = UNNotificationRequest(identifier: alarm.uuid, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { (error) in
            if let error = error {
                print("😡There was an error in \(#function) ; \(error) ; \(error.localizedDescription)")
            }
        }
    }

//    func cancelUserNotifications(for alarm: Alarm) {
//        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: [alarm.uuid])
//    }
}

