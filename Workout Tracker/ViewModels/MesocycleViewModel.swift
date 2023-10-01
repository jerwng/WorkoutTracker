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
        
//        @FetchRequest(sortDescriptors: []) var mesocycles: FetchedResults<Mesocycle>
//        
//        @FetchRequest(
//            sortDescriptors: [SortDescriptor(\.isComplete)],
//            predicate: NSPredicate(format: "isComplete == %@", NSNumber(value: true))
//        ) var activeMesocycle: FetchedResults<Mesocycle>
        
        init(context: NSManagedObjectContext) {
            self.managedObjectContext = context
        }
        
        func fetch() {
            let fetchRequest: NSFetchRequest<Mesocycle> = Mesocycle.fetchRequest()
            let predicate = NSPredicate(format: "isComplete == %@", NSNumber(value: true))
            
            fetchRequest.predicate = predicate
            
            do {
                let fetchResult = try managedObjectContext.fetch(fetchRequest)

                if !(fetchResult.isEmpty) {
                    activeMesocycle = fetchResult[0]
                } else {
                    // If no active mesocycle, auto create a new mesocycle
                }
            } catch {
                print("Error fetching active mesocycle: \(error)")
            }
        }
    }
}
