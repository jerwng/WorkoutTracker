//
//  DataUtils.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-10-02.
//

import Foundation
import CoreData

protocol EntityWithSequence {
    var sequence: Int16 { get } // set { get } to have property as read-only
}

protocol EntityWithExerciseNameSequence {
    var exerciseNameSequence: Int16 { get }
}

struct EntityUtils {
    func getEntityHighestSequence<T: EntityWithSequence>(context: NSManagedObjectContext, fetchRequest: NSFetchRequest<T>) -> Int16 {
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "sequence", ascending: false)]
    
        do {
            let results = try context.fetch(fetchRequest)
            
            if (!results.isEmpty) {
                return results[0].sequence
            }
            
            return 0
        } catch {
            print("Error fetching entity with highest sequence: \(error)")
        }

        return -1
    }
    
    func getEntityHighestExerciseNameSequence<T: EntityWithExerciseNameSequence>(context: NSManagedObjectContext, fetchRequest: NSFetchRequest<T>) -> Int16 {
        fetchRequest.sortDescriptors = [NSSortDescriptor(key: "exerciseNameSequence", ascending: false)]
    
        do {
            let results = try context.fetch(fetchRequest)
            
            if (!results.isEmpty) {
                return results[0].exerciseNameSequence
            }
            
            return 0
        } catch {
            print("Error fetching entity with highest exercise name sequence: \(error)")
        }

        return -1
    }
}
