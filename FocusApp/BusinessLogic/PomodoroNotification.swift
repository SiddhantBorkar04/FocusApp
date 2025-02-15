//
//  PomodoroNotification.swift
//  FocusApp
//
//  Created by Siddhant Borkar on 7/1/24.
//

import Foundation
import UserNotifications

class PomodoroNotification {
    static func checkAuthorization(completion: @escaping (Bool) -> Void) {
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.getNotificationSettings {settings in
            switch settings.authorizationStatus{
            case .authorized:
                completion(true)
            case .notDetermined:
                notificationCenter.requestAuthorization(options: [.alert, .badge, .sound]) { allowed, error in
                    completion(allowed)
                }
            default:
                completion(false)
            }
        }
    }
    
    static func scheduleNotification(seconds: TimeInterval, title: String, body: String) {
        let notificationCenter = UNUserNotificationCenter.current()
        
        //remove all notification
        notificationCenter.removeAllDeliveredNotifications()
        notificationCenter.removeAllPendingNotificationRequests()
        //set up contents
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body
        content.sound = .default
        content.sound = UNNotificationSound(named: UNNotificationSoundName(rawValue: PomodoroAudioSounds.done.resource))
        //trigger
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: seconds, repeats: false)
        //create request
        let request = UNNotificationRequest(identifier: "my-notification", content: content, trigger: trigger)
        //add notification to the center
        notificationCenter.add(request)
    }
}
