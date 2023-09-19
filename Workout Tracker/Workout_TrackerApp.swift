//
//  Workout_TrackerApp.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-04.
//

import SwiftUI

@main
struct Workout_TrackerApp: App {
    // Initialize and inject Core Data data controller
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                // Environment object to make data controller available everywhere
                .environment(
                    \.managedObjectContext, // Load data into memory to handle changes
                     dataController.container.viewContext)
        }
    }
}
