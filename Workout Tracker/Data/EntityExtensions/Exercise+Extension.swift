//
//  Exercise+Extension.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-10-24.
//

import Foundation
import CoreData

extension Exercise {
    var exerciseName: String {
        return "\(name ?? "Unknown Exercise")"
    }
    
    var exerciseNotes: String {
        return "\(notes ?? "")"
    }
    
    static func create(
        context: NSManagedObjectContext,
        name: String,
        notes: String,
        repRangeTop: Int16,
        repRangeBot: Int16,
        sets: Int16
    ) -> Exercise? {
            
        let newExercise = Exercise(context: context)
        newExercise.name = name
        newExercise.notes = notes
        newExercise.repRangeTop = repRangeTop
        newExercise.repRangeBot = repRangeBot
        newExercise.sets = sets
        
        do {
            try context.save()
            return newExercise

        } catch {
            print("Error creating Exercise \(name): \(error)")
        }
        
        return nil
    }
    
    func delete() {
        managedObjectContext?.delete(self)
        
        try? managedObjectContext?.save()
    }
}
