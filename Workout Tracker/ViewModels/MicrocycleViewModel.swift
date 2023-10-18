//
//  MicrocycleViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-10-18.
//

import Foundation
import SwiftUI
import CoreData

extension MicrocycleView {
    @MainActor class MicrocycleViewModel: ObservableObject {
        private let context: NSManagedObjectContext
        
        @Published var microcycle: Microcycle?
        
        init(context: NSManagedObjectContext, microcycleId: Microcycle.ID) {
            self.context = context
            self.microcycle = fetchMicrocycleById(microcycleId: microcycleId)
        }
        
        // ---------------------------------------- CRUD Microcycles ----------------------------------------
        func fetchMicrocycleById(microcycleId: Microcycle.ID) -> Microcycle? {
            if let _microcycleId = microcycleId {
                let fetchRequest: NSFetchRequest<Microcycle> = Microcycle.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "id == %@", _microcycleId.uuidString)
                
                do {
                    let results = try context.fetch(fetchRequest)
                    if (!results.isEmpty) {
                        return results[0]
                    }

                } catch {
                    print("Error fetching Microcycle \(_microcycleId.uuidString): \(error)")
                }
            }

            return nil
        }
        
    }
    
}
