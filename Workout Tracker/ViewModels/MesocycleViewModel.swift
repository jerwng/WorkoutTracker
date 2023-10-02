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
        }
        
        func fetch() {
            let fetchRequest: NSFetchRequest<Mesocycle> = Mesocycle.fetchRequest()
            let predicate = NSPredicate(format: "isComplete == %@", NSNumber(value: false))
            
            fetchRequest.predicate = predicate
            
            do {
                let fetchResult = try managedObjectContext.fetch(fetchRequest)

                if !(fetchResult.isEmpty) {
                    activeMesocycle = fetchResult[0]
                } else {
                    // If no active mesocycle, auto create a new mesocycle
                    add()
                }
            } catch {
                print("Error fetching active mesocycle: \(error)")
            }
        }
        
        func add() {
            _ = Mesocycle.create(context: managedObjectContext)
        }
    }
}
