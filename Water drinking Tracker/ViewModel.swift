//
//  ViewModel.swift
//  Water drinking Tracker
//
//  Created by Linah on 25/04/1446 AH.
//import Foundation
//import SwiftUI
////
//class Screen1ViewModel: ObservableObject{
//    @Published var bodyWeight: Double = 0.0
//    @Published var intakeAmount: Double = 0.0
//    @Published var needLiters: Double = 2.7
//    @Published  var isNavigateToNext = false
//    @Published var selectedStartTime: Date = Date()
//    @Published var selectedEndTime: Date = Date()
//    func calcNeedLuters(){
//        needLiters = bodyWeight*0.03
//    }
//     
//    
//}
import Foundation
import SwiftUI

class Screen1ViewModel: ObservableObject {
    @Published var bodyWeight: Double = 0.0 {
        didSet {
            calculateNeedLiters()
        }
    }
    
    @Published var intakeAmount: Double = 0.0
    @Published var needLiters: Double = 2.7
    @Published var isNavigateToNext: Bool = false
    @Published var selectedStartTime: Date = Date()
    @Published var selectedEndTime: Date = Date()

    
    private func calculateNeedLiters() {
        needLiters = bodyWeight * 0.03
    }

   
    func calculateIntake() {
        intakeAmount = needLiters
    }
}



//Class scheduleNotifications
//private func scheduleNotifications() {
//    let center = UNUserNotificationCenter.current()
//    center.removeAllPendingNotificationRequests()
//    
//    let content = UNMutableNotificationContent()
//    content.title = "Water Reminder"
//    content.body = "It's time to drink water to stay hydrated!"
//    content.sound = .default
//    
//    let startTime = Calendar.current.dateComponents([.hour, .minute], from: userData.selectedStartTime)
//    let endTime = Calendar.current.dateComponents([.hour, .minute], from: userData.selectedEndTime)
//    
//    for hour in startTime.hour!...endTime.hour! {
//        var dateComponents = DateComponents()
//        dateComponents.hour = hour
//        dateComponents.minute = startTime.minute
//        
//        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
//        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
//        center.add(request)
//    }
//}
