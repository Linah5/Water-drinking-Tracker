//
//  Water_drinking_TrackerApp.swift
//  Water drinking Tracker
//
//  Created by Linah on 16/04/1446 AH.
//

import SwiftUI
import SwiftData
@main
struct Water_drinking_TrackerApp: App {
    var body: some Scene {
       WindowGroup {
           ContentView()
        }
        .modelContainer(for: DataItem.self)
    }
}
