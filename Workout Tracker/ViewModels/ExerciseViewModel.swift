//
//  ExerciseViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-12-03.
//

import Foundation
import CoreData

extension ExerciseView {
    @MainActor class ExerciseViewModel: ObservableObject {
        let context: NSManagedObjectContext
        let exercise: Exercise
        @Published var exerciseEntries: [ExerciseEntry] = []
        @Published var previousExerciseEntries: [ExerciseEntry] = []
        @Published var isSheetOpen: Bool
        
        init(context: NSManagedObjectContext, exercise: Exercise) {
            self.context = context
            self.exercise = exercise
            self.isSheetOpen = false
            initExerciseEntries()
            initPreviousExerciseEntries()
        }
        
        func initExerciseEntries() {
            self.exerciseEntries = self.exercise.exerciseExerciseEntries
        }

        func initPreviousExerciseEntries() {
            self.previousExerciseEntries = []

            // Fetch the last previous Exercise Entry sorted by exerciseNameSequence, where the Exercise Entry is under the current Exercise (name), but not the Exercise (id)
            // This will give access to the Exercise containing the entire previous Exercise Entries array
            let lastPreviousExerciseEntryFetchRequest = FetchRequestUtils.getLastPreviousExerciseEntryFetchRequest(exercise: exercise)
            
            do {
                let fetchResult = try context.fetch(lastPreviousExerciseEntryFetchRequest)
                if let lastPreviousExerciseEntry = fetchResult.first {
                    // Want the entire Exercise Entries array from the Exercise containing the last previous Exercise Entry
                    self.previousExerciseEntries = lastPreviousExerciseEntry.exercise?.exerciseExerciseEntries ?? []
                }
            } catch {
                print("Error fetching first previous exercise entry : \(error)")
            }
        }
        
        func setIsSheetOpen(isSheetOpen: Bool) {
            self.isSheetOpen = isSheetOpen
        }
    }
}
