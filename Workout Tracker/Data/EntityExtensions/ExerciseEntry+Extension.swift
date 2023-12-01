//
//  ExerciseEntry+Extension.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-11-30.
//

import Foundation
import CoreData

extension ExerciseEntry: EntityWithSequence {
    var exerciseEntryNotes: String {
        return notes ?? ""
    }
    
    var exerciseEntryTime: String {
        return time ?? ""
    }
    
    var exerciseEntryId: String {
        return id?.uuidString ?? "Unknown Exercise Entry"
    }
    
    static func create(
        context: NSManagedObjectContext,
        exerciseId: Exercise.ID,
        reps: Int16,
        weight: Int16,
        time: String,
        notes: String
    ) -> ExerciseEntry? {
        let highestExerciseEntrySequenceFetchRequest: NSFetchRequest<ExerciseEntry> = NSFetchRequest(entityName: "ExerciseEntry")
     
        if let _exerciseId = exerciseId {
            highestExerciseEntrySequenceFetchRequest.predicate = NSPredicate(format: "exercise.id == %@", _exerciseId.uuidString)
        }
        
        let highestExerciseEntrySequence = EntityUtils().getEntityHighestSequence(
            context: context,
            fetchRequest: highestExerciseEntrySequenceFetchRequest
        )

        // Highest exercise entry sequence returns -1 if error occured fetching highest sequence value
        // Prevent creating new exercise entry to prevent corrupting sequence order
        if (highestExerciseEntrySequence < 0) {
            return nil
        }
        
        let newExerciseEntry = ExerciseEntry(context: context)
        newExerciseEntry.reps = reps
        newExerciseEntry.weight = weight
        newExerciseEntry.time = time
        newExerciseEntry.notes = notes
        newExerciseEntry.sequence = Int16(highestExerciseEntrySequence + 1)
        
        do {
            try context.save()
            return newExerciseEntry

        } catch {
            print("Error creating Exercise Entry: \(error)")
        }
        
        return nil
    }
    
    func update(
        newReps: Int16?,
        newWeight: Int16?,
        newTime: String?,
        newNotes: String?
    ) {
        reps = newReps ?? reps
        weight = newWeight ?? weight
        time = newTime ?? time
        notes = newNotes ?? notes
        
        do {
            try managedObjectContext?.save()
        } catch {
            print("Error updating Exercise Entry \(exerciseEntryId): \(error)")
        }
    }
    
    func delete() {
        managedObjectContext?.delete(self)
        
        do {
            try managedObjectContext?.save()
        } catch {
            print("Error deleting Exercise Entry \(exerciseEntryId): \(error)")
        }
    }
}
