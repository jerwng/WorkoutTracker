//
//  MesocycleViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-23.
//

import Foundation
import SwiftUI
import CoreData

extension MesocycleView {
    
    @MainActor class MesocycleViewModel: ObservableObject {
        private let managedObjectContext: NSManagedObjectContext
        @Published var activeMesocycle: Mesocycle?
        
        init(context: NSManagedObjectContext) {
            self.managedObjectContext = context
            fetchActiveMesocycle()
        }
        
        // ---------------------------------------- Active Mesocycle Functions ----------------------------------------
        func fetchActiveMesocycle() {
            let fetchRequest: NSFetchRequest<Mesocycle> = Mesocycle.fetchRequest()
            let predicate = NSPredicate(format: "isComplete == %@", NSNumber(value: false))
            
            fetchRequest.predicate = predicate
            
            do {
                let fetchResult = try managedObjectContext.fetch(fetchRequest)

                if !(fetchResult.isEmpty) {
                    activeMesocycle = fetchResult[0]
                } else {
                    // If no active mesocycle, auto create a new mesocycle
                    createMesocycle()
                }
            } catch {
                print("Error fetching active mesocycle: \(error)")
            }
        }
        
        func createMicrocycleToActiveMesocycle() {
            if let newMicrocycle = Microcycle.create(context: managedObjectContext, mesocycleId: activeMesocycle?.id) {
                activeMesocycle?.addMicrocycle(newMicrocycle: newMicrocycle)
                fetchActiveMesocycle()
            }
        }
        
        func getActiveMesocycleMicrocycles() -> [Microcycle] {
            return activeMesocycle?.mesocycleMicrocycles ?? []
        }
        
        func setActiveMesocycleComplete() {
            activeMesocycle?.setIsComplete()
            fetchActiveMesocycle()
        }
        
        // ---------------------------------------- CRUD Mesocycles ----------------------------------------
        func createMesocycle() {
            if let newMesocycle = Mesocycle.create(context: managedObjectContext) {
                activeMesocycle = newMesocycle
            }
        }
    }
}
