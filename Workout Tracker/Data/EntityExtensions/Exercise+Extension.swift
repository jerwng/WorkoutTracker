//
//  Exercise+Extension.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-10-24.
//

import Foundation
import CoreData

extension Exercise: EntityWithSequence {
    var exerciseName: String {
        return "\(name ?? "Unknown Exercise")"
    }
    
    var exerciseNotes: String {
        return "\(notes ?? "")"
    }
    
    var exerciseExerciseEntries: [ExerciseEntry] {
        let exerciseEntriesSet = exerciseEntries as? Set<ExerciseEntry> ?? []
        
        return exerciseEntriesSet.sorted {
            $0.sequence < $1.sequence
        }
    }
    
    var exerciseId: String {
        return id?.uuidString ?? "Unknown Exercise Id"
    }
    
    static func create(
        context: NSManagedObjectContext,
        dayId: Day.ID,
        name: String,
        notes: String,
        repRangeTop: Int16,
        repRangeBot: Int16,
        sets: Int16
    ) -> Exercise? {
        let highestExerciseSequenceFetchRequest: NSFetchRequest<Exercise> = NSFetchRequest(entityName: "Exercise")
     
        if let _dayId = dayId {
            highestExerciseSequenceFetchRequest.predicate = NSPredicate(format: "day.id == %@", _dayId.uuidString)
        }
        
        let highestExerciseSequence = EntityUtils().getEntityHighestSequence(
            context: context,
            fetchRequest: highestExerciseSequenceFetchRequest
        )

        // Highest exercise sequence returns -1 if error occured fetching highest sequence value
        // Prevent creating new exercise to prevent corrupting sequence order
        if (highestExerciseSequence < 0) {
            return nil
        }
            
        let newExercise = Exercise(context: context)
        newExercise.id = UUID()
        newExercise.name = name
        newExercise.notes = notes
        newExercise.repRangeTop = repRangeTop
        newExercise.repRangeBot = repRangeBot
        newExercise.sets = sets
        newExercise.sequence = Int16(highestExerciseSequence + 1)
        
        do {
            try context.save()
            return newExercise

        } catch {
            print("Error creating Exercise \(name): \(error)")
        }
        
        return nil
    }
    
    func update(
        context: NSManagedObjectContext,
        newName: String?,
        newNotes: String?,
        newRepRangeTop: Int16?,
        newRepRangeBot: Int16?,
        newSets: Int16?
    ) {
        name = newName ?? name
        notes = newNotes ?? notes
        repRangeTop = newRepRangeTop ?? repRangeTop
        repRangeBot = newRepRangeBot ?? repRangeBot
        sets = newSets ?? sets
        
        do {
            try context.save()
        } catch {
            print("Error updating Exercise \(exerciseName): \(error)")
        }
    }
    
    func delete() {
        managedObjectContext?.delete(self)
        
        try? managedObjectContext?.save()
    }
    
    func addExerciseEntry(exerciseEntry: ExerciseEntry) {
        addToExerciseEntries(exerciseEntry)
    
        do {
            try managedObjectContext?.save()
        } catch {
            print("Error adding Exercise Entry \(exerciseEntry.exerciseEntryId) to Exercise \(exerciseName): \(error)")
        }
    }
}
