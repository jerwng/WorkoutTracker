//
//  Mesocycle+Extension.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-28.
//

import Foundation
import CoreData

extension Mesocycle {
    var mesocycleName: String {
        return "\(name ?? "Unknown Mesocycle")"
    }
    
    var mesocycleMicrocycles: [Microcycle] {
        let microcyclesSet = microcycles as? Set<Microcycle> ?? []
        
        return microcyclesSet.sorted {
            $0.sequence < $1.sequence
        }
    }
    
    // Static func since Mesocycle won't be defined during creation
    static func create(moc: NSManagedObjectContext) -> Mesocycle {
        return Mesocycle(context: moc)
    }
    
    func update(newName: String?, newIsComplete: Bool?) {
        let context = managedObjectContext
        name = newName ?? name
        isComplete = newIsComplete ?? isComplete
        
        try? context?.save()
    }
    
    func delete() {
        let context = managedObjectContext
        context?.delete(self)
        
        try? context?.save()
    }
}
