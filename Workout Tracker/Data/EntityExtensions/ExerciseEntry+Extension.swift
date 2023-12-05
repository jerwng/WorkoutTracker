//
//  ExerciseEntry+Extension.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-11-30.
//

import Foundation
import CoreData

extension ExerciseEntry: EntityWithSequence, EntityWithExerciseNameSequence {
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
        exercise: Exercise,
        reps: Int16,
        weight: Int16,
        time: String,
        notes: String
    ) -> ExerciseEntry? {
        let highestExerciseEntrySequenceFetchRequest: NSFetchRequest<ExerciseEntry> = NSFetchRequest(entityName: "ExerciseEntry")
     
        if let exerciseId = exercise.id {
            highestExerciseEntrySequenceFetchRequest.predicate = NSPredicate(format: "exercise.id == %@", exerciseId.uuidString)
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
        
        // Note: Calculate the exerciseNameSequence property in ExerciseEntry entity. Build a sequence based on the Exercise name and group Exercise Entries with same Exercise Id.

        /**
         What is this exerciseNameSequence used for?
         - Exercise Entries under the same Exercise Id share the same exerciseNameSequence.
         - exerciseNameSequence is used to determine the previous exercise entries.
         - Sharing same exerciseNameSequence across Exercise Id reduces potential ordering issue if user enters Exercise Entries of same Exercise Name on different days without order.
           exerciseNameSequence order remains based on the first entered Exercise Entry of the Exercise id group.
         */
        let highestExerciseEntryNameSequenceFetchRequest: NSFetchRequest<ExerciseEntry> = NSFetchRequest(entityName: "ExerciseEntry")
     
        if let exerciseName = exercise.name {
            highestExerciseEntryNameSequenceFetchRequest.predicate = NSPredicate(format: "exercise.name == %@", exerciseName)
        }
        
        let highestExerciseEntryNameSequence = EntityUtils().getEntityHighestExerciseNameSequence(
            context: context,
            fetchRequest: highestExerciseEntryNameSequenceFetchRequest
        )

        // Highest exercise entry name sequence returns -1 if error occured fetching highest name sequence value
        // Prevent creating new exercise entry to prevent corrupting sequence order
        if (highestExerciseEntryNameSequence < 0) {
            return nil
        }
        
        let newExerciseEntry = ExerciseEntry(context: context)
        newExerciseEntry.id = UUID()
        newExerciseEntry.reps = reps
        newExerciseEntry.weight = weight
        newExerciseEntry.time = time
        newExerciseEntry.notes = notes
        newExerciseEntry.sequence = Int16(highestExerciseEntrySequence + 1)
        
        // Exercise Entries under Exercise with the same ID share an exerciseNameSequence, see above block comment for explanation on this behaviour
        if (exercise.exerciseExerciseEntries.isEmpty) {
            newExerciseEntry.exerciseNameSequence = Int16(highestExerciseEntryNameSequence + 1)
        } else {
            let lastExerciseExerciseEntry = exercise.exerciseExerciseEntries.last!
            newExerciseEntry.exerciseNameSequence = Int16(lastExerciseExerciseEntry.exerciseNameSequence)
        }
        
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
