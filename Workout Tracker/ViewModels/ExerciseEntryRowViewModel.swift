//
//  ExerciseEntryRowViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-12-03.
//

import Foundation

extension ExerciseEntryRow {
    @MainActor class ExerciseEntryRowViewModel: ObservableObject {
        @Published var exerciseEntry: ExerciseEntry
        @Published var isSheetOpen: Bool

        // Exercise intended to be Optional. "Previous" exercise entry rows also use this view and does not provide an Exercise entity
        let exercise: Exercise?
        let isItalic: Bool

        init(exercise: Exercise?, exerciseEntry: ExerciseEntry, isItalic: Bool) {
            self.exercise = exercise
            self.exerciseEntry = exerciseEntry
            self.isItalic = isItalic
            self.isSheetOpen = false
        }
        
        func buildExerciseEntryRowString() -> String {
            var curExerciseEntryRowString = String(exerciseEntry.reps) + " @ " + String(exerciseEntry.weight) + "lbs"
            
            if (!exerciseEntry.exerciseEntryTime.isEmpty) {
                curExerciseEntryRowString += ", " + exerciseEntry.exerciseEntryTime
            }
            
            return curExerciseEntryRowString
        }
        
        func setIsSheetOpen(isSheetOpen: Bool) {
            self.isSheetOpen = isSheetOpen
        }
    }
}
