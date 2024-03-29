//
//  Mesocycle+Extension.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-28.
//

import Foundation
import CoreData

/**
Ensure Mesocycle conforms to protocols
 - EntityWithSequence protocol ensures type contains "sequence" property
 */
extension Mesocycle: EntityWithSequence {
    var mesocycleUUIDString: String {
        return "\(id?.uuidString ?? "Unknown Mesocycle")"
    }
    
    var mesocycleName: String {
        return "\(name ?? "Unknown Mesocycle")"
    }
    
    var mesocycleMicrocycles: [Microcycle] {
        let microcyclesSet = microcycles as? Set<Microcycle> ?? []
        
        return microcyclesSet.sorted {
            $0.sequence < $1.sequence
        }
    }
    
    /**
    Find the given Microcycle's index in the mesocycleMicrocycles array
    */
    func findMesocycleMicrocyclesIndex(microcycle: Microcycle) -> Array<Microcycle>.Index? {
        return mesocycleMicrocycles.firstIndex(of: microcycle)
    }
    
    func getNextSequencedMesocycleMicrocycle(microcycle: Microcycle) -> Microcycle? {
        let currentMicrocycleIndex = findMesocycleMicrocyclesIndex(microcycle: microcycle)
        
        if (currentMicrocycleIndex == nil) {
            return nil
        }
        
        if (currentMicrocycleIndex! == mesocycleMicrocycles.count - 1) {
            return nil
        }
        
        return mesocycleMicrocycles[currentMicrocycleIndex! + 1]
    }
    
    func getPreviousSequencedMesocycleMicrocycle(microcycle: Microcycle) -> Microcycle? {
        let currentMicrocycleIndex = findMesocycleMicrocyclesIndex(microcycle: microcycle)
        
        if (currentMicrocycleIndex == nil) {
            return nil
        }
        
        if (currentMicrocycleIndex! == 0) {
            return nil
        }
        
        return mesocycleMicrocycles[currentMicrocycleIndex! - 1]
    }
    
    // Static func since Mesocycle won't be defined during creation
    static func create(context: NSManagedObjectContext) -> Mesocycle? {
        let highestMesocycleSequenceFetchRequest: NSFetchRequest<Mesocycle> = NSFetchRequest(entityName: "Mesocycle")
        let highestMesocycleSequence = EntityUtils().getEntityHighestSequence(
            context: context,
            fetchRequest: highestMesocycleSequenceFetchRequest
        )

        // Highest mesocycle sequence returns -1 if error occured fetching highest sequence value
        // Prevent creating new mesocycle to prevent corrupting sequence order
        if (highestMesocycleSequence < 0) {
            return nil
        }
        
        let newMesocycle = Mesocycle(context: context)
        newMesocycle.id = UUID()
        newMesocycle.name = "Mesocycle \(highestMesocycleSequence + 1)"
        newMesocycle.isComplete = false
        newMesocycle.sequence = Int16(highestMesocycleSequence + 1)
        
        try? context.save()
        
        return newMesocycle
    }
    
    func update(newName: String?, newIsComplete: Bool?) {
        let context = managedObjectContext
        name = newName ?? name
        isComplete = newIsComplete ?? isComplete
        
        try? context?.save()
    }
    
    func addMicrocycle(newMicrocycle: Microcycle) {
        addToMicrocycles(newMicrocycle)
    
        try? managedObjectContext?.save()
    }
    
    func setIsComplete() {
        let context = managedObjectContext
        
        isComplete = true
        
        do {
            try context?.save()
        } catch {
            print("Error setting Mesocycle \(mesocycleUUIDString) to complete: \(error)")
        }
    }
    
    func delete() {
        let context = managedObjectContext
        context?.delete(self)
        
        try? context?.save()
    }
}
