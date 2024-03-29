//
//  Day+Extension.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-10-18.
//

import Foundation
import CoreData

extension Day: EntityWithSequence {
    var dayName: String {
        return "\(name ?? "Unknown Day")"
    }
    
    var dayExercises: [Exercise] {
        let exersiesSet = exercises as? Set<Exercise> ?? []
        
        return exersiesSet.sorted {
            $0.sequence < $1.sequence
        }
    }
    
    var dayMicrocycleName: String {
        return  "\(microcycle?.microcycleName ?? "Unknown Microcycle")"
    }
    
    var dayId: String {
        return id?.uuidString ?? "Unknown Day Id"
    }

    static func create(context: NSManagedObjectContext, microcycleId: Microcycle.ID) -> Day? {
        let highestDaySequenceFetchRequest: NSFetchRequest<Day> = NSFetchRequest(entityName: "Day")
     
        if let _microcycleId = microcycleId {
            highestDaySequenceFetchRequest.predicate = NSPredicate(format: "microcycle.id == %@", _microcycleId.uuidString)
        }
        
        let highestDaySequence = EntityUtils().getEntityHighestSequence(
            context: context,
            fetchRequest: highestDaySequenceFetchRequest
        )

        // Highest day sequence returns -1 if error occured fetching highest sequence value
        // Prevent creating new day to prevent corrupting sequence order
        if (highestDaySequence < 0) {
            return nil
        }
        
        let newDay = Day(context: context)
        newDay.id = UUID()
        newDay.name = "Day \(highestDaySequence + 1)"
        newDay.sequence = Int16(highestDaySequence + 1)
        
        try? context.save()
        
        return newDay
    }
    
    func delete() {
        managedObjectContext?.delete(self)
        
        do {
            try managedObjectContext?.save()
        } catch {
            print("Error deleting Day \(dayName): \(error)")
        }
    }
    
    func addExercise(newExercise: Exercise) {
        addToExercises(newExercise)
        
        do {
            try managedObjectContext?.save()
        } catch {
            print("Error adding Exercise \(newExercise.id?.uuidString ?? "") to day: \(error)")
        }
    }
}
