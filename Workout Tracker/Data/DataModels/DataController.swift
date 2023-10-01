//
//  DataController.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-19.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    // Core data type responsible for loading model, prepares Core Data to load the model
    let container = NSPersistentContainer(name: "Cycle")
    
    init() {
        // Load Core Data
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
 
        }
    }
}
