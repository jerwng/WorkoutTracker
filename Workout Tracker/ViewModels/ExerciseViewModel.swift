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
        
        // TODO: Implement this function
        func initPreviousExerciseEntries() {
            self.previousExerciseEntries = []
        }
        
        func setIsSheetOpen(isSheetOpen: Bool) {
            self.isSheetOpen = isSheetOpen
        }
    }
}
