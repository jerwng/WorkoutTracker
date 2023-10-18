//
//  Mesocycle+Extensions.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-28.
//

import Foundation
import CoreData

extension Microcycle: EntityWithSequence {
    var microcycleName: String {
        return "\(name ?? "Unknown Microcycle")"
    }
    
    var micorcycleDays: [Day] {
        let daysSet = days as? Set<Day> ?? []
        
        return daysSet.sorted {
            $0.sequence < $1.sequence
        }
    }
    
    // Static func since Microcycle won't be defined during creation
    static func create(context: NSManagedObjectContext, mesocycleId: Mesocycle.ID) -> Microcycle? {
        let highestMicrocycleSequenceFetchRequest: NSFetchRequest<Microcycle> = NSFetchRequest(entityName: "Microcycle")
     
        if let requiredMesocycleId = mesocycleId {
            highestMicrocycleSequenceFetchRequest.predicate = NSPredicate(format: "mesocycle.id == %@", requiredMesocycleId.uuidString)
        }
        
        let highestMicrocycleSequence = EntityUtils().getEntityHighestSequence(
            context: context,
            fetchRequest: highestMicrocycleSequenceFetchRequest
        )

        // Highest microcycle sequence returns -1 if error occured fetching highest sequence value
        // Prevent creating new microcycle to prevent corrupting sequence order
        if (highestMicrocycleSequence < 0) {
            return nil
        }
        
        let newMicrocycle = Microcycle(context: context)
        newMicrocycle.id = UUID()
        newMicrocycle.name = "Microcycle \(highestMicrocycleSequence + 1)"
        newMicrocycle.sequence = Int16(highestMicrocycleSequence + 1)
        
        try? context.save()
        
        return newMicrocycle
    }
    
    func delete() {
        let context = managedObjectContext
        context?.delete(self)
        
        try? context?.save()
    }
}
