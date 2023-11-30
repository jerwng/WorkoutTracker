//
//  ExerciseListViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-11-29.
//

import Foundation
import SwiftUI
import CoreData

extension ExerciseListView {
    @MainActor class ExerciseListViewModel: ObservableObject {
        private let context: NSManagedObjectContext
        @Published var exerciseRows: [Exercise] = []

        // TODO: Update to CoreData entity type
        @Published var exerciseEntriesByExercise: [Exercise_MockData.ID: [ExerciseEntry_MockData]] = [:]
        
        init(context: NSManagedObjectContext, day: Day) {
            self.context = context
            initExerciseRows(day: day)
            initExerciseEntries(day: day)
        }
        
        func initExerciseRows(day: Day) {
            setExerciseRows(exerciseRows: day.dayExercises)
        }
        
        func initExerciseEntries(day: Day) {
            // Get the Day's exercise entries, create an entry with the key value pair: Exercise.ID -> ExerciseEntry
            setExerciseEntriess()
        }
        
        func setExerciseRows(exerciseRows: [Exercise]) {
            self.exerciseRows = exerciseRows
        }
        
        func setExerciseEntriess() {
            // TODO: Initialize exercise entries for exercises in the given day
        }
    }
}
