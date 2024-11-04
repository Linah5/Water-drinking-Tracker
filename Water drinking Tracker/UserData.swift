//
//  UserData.swift
//  Water drinking Tracker
//
//  Created by Linah on 25/04/1446 AH.
//
import Foundation
import Combine
import UserNotifications

class UserData: ObservableObject {
    //screen1 Data
    @Published var bodyWeight: String = ""
    @Published var intakeAmount: Double = 0.0
    @Published var needLiters: Double = 2.7
    @Published var isNavigateToNext = false
    @Published var waterIntake: Double = 0.0

   //screen2 Data
    @Published var selectedStartTime: Date = Date()
    @Published var selectedEndTime: Date = Date()
    @Published var timePeriodStart: String = "AM"
    @Published var timePeriodEnd: String = "PM"
    @Published var selectedInterval: String = "15 Mins"

  
    var calculatedNeedLiters: Double {
        guard let weight = Double(bodyWeight), weight > 0 else { return 0.0 }
        return weight * 0.03
    }

    func calculateIntake() {
        intakeAmount = calculatedNeedLiters
    }


    func getIconName() -> String {
        let waterIntakePercentage = ((waterIntake / needLiters) * 100)
        switch waterIntakePercentage {
        case 0..<20:
            return "zzz"
        case 20..<60:
            return "tortoise.fill"
        case 60..<99:
            return "hare.fill"
        case 99...100:
            return "hands.clap.fill"
        default:
            return "zzz"
        }
    }

  
    func resetData() {
        bodyWeight = ""
        intakeAmount = 0.0
        needLiters = 2.7
        waterIntake = 0.0
        selectedStartTime = Date()
        selectedEndTime = Date()
        timePeriodStart = "AM"
        timePeriodEnd = "PM"
        selectedInterval = "15 Mins"
        isNavigateToNext = false
    }

   
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("Permission granted")
            } else if let error = error {
                print("Permission error: \(error.localizedDescription)")
            } else {
                print("Permission denied")
            }
        }
    }


    func scheduleNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()

        let intervalMinutes = getIntervalInMinutes()
        var nextNotificationDate = selectedStartTime

        while nextNotificationDate < selectedEndTime {
            let content = UNMutableNotificationContent()
            content.title = "Water Reminder"
            content.body = "It's time to drink water to stay hydrated!"
            content.sound = .default

            let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.hour, .minute], from: nextNotificationDate), repeats: false)
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            UNUserNotificationCenter.current().add(request)

            nextNotificationDate = Calendar.current.date(byAdding: .minute, value: intervalMinutes, to: nextNotificationDate) ?? nextNotificationDate
        }
    }

    private func getIntervalInMinutes() -> Int {
        switch selectedInterval {
        case "15 Mins":
            return 15
        case "30 Mins":
            return 30
        case "60 Mins":
            return 60
        case "90 Mins":
            return 90
        case "2 Hours":
            return 120
        case "3 Hours":
            return 180
        case "4 Hours":
            return 240
        case "5 Hours":
            return 300
        default:
            return 15
        }
    }
}
