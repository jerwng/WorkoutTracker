//
//  FetchRequestUtils.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-11-28.
//

import Foundation
import CoreData

class FetchRequestUtils {
    static func getActiveMesocycleFetchRequest() -> NSFetchRequest<Mesocycle> {
        let fetchRequest: NSFetchRequest<Mesocycle> = Mesocycle.fetchRequest()
        let predicate = NSPredicate(format: "isComplete == %@", NSNumber(value: false))
        
        fetchRequest.predicate = predicate
        
        return fetchRequest
    }
    
    /**
     Get the last exercise entry before the first exercise entry in the current exercise.
     */
    static func getLastPreviousExerciseEntryFetchRequest(exercise: Exercise) -> NSFetchRequest<ExerciseEntry> {
        let exerciseName = exercise.exerciseName
        let exerciseIdString = exercise.exerciseId
        
        let fetchRequest: NSFetchRequest<ExerciseEntry> = ExerciseEntry.fetchRequest()
        let exerciseNamePredicate = NSPredicate(format: "exercise.name == %@", exerciseName) // Previous exercise entry should be from Exercise with the same name
        let exerciseIdPredicate = NSPredicate(format: "exercise.id != %@", exerciseIdString) // Previous exercise entry should be from another Exercise (different id)
        
        var subPredicates = [exerciseNamePredicate, exerciseIdPredicate]
        
        // Get the Exercise's first Exercise Entry in order to get Exercise Entry before this one (see if block below)
        let firstExerciseEntry = exercise.exerciseExerciseEntries.first

        if let firstExerciseEntryExerciseNameSequence = firstExerciseEntry?.exerciseNameSequence {
            // Previous Exercise Entry should be before the first Exercise Entry of the current exercise, sorted by exerciseNameSequence
            let exerciseNameSequencePredicate = NSPredicate(format: "exerciseNameSequence < %d", firstExerciseEntryExerciseNameSequence)

            subPredicates.append(exerciseNameSequencePredicate)
        }
        
        let predicate = NSCompoundPredicate(type: .and, subpredicates: subPredicates)
        
        fetchRequest.predicate = predicate
        fetchRequest.fetchLimit = 1 // Get first item
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "exerciseNameSequence", ascending: false)] // Ascending false to sort highest exerciseNameSequence first
        
        return fetchRequest
    }
}
