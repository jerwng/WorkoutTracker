//
//  ExerciseInputSheetViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-12-01.
//

import Foundation
import SwiftUI
import CoreData

extension ExerciseInputSheet {
    @MainActor class ExerciseInputSheetViewModel: ObservableObject {
        private let context: NSManagedObjectContext
        @Published var selectedExercise: Exercise
        @Published var selectedExerciseEntry: ExerciseEntry?
        
        @Binding var isSheetOpen: Bool
        
        @Published var weight: String
        @Published var reps: String
        @Published var time: String
        @Published var notes: String
        @Published var name: String
        
        init(context: NSManagedObjectContext, isSheetOpen: Binding<Bool>, selectedExercise: Exercise, selectedExerciseEntry: ExerciseEntry?) {
            self.context = context
            self.selectedExercise = selectedExercise
            self.selectedExerciseEntry = selectedExerciseEntry
            
            self._isSheetOpen = isSheetOpen
            self.name = selectedExercise.exerciseName

            if let _selectedExerciseEntry = selectedExerciseEntry {
                self.weight = String(_selectedExerciseEntry.weight)
                self.reps = String(_selectedExerciseEntry.reps)
                self.time = _selectedExerciseEntry.exerciseEntryTime
                self.notes = _selectedExerciseEntry.exerciseEntryNotes
            } else {
                self.weight = ""
                self.reps = ""
                self.time = ""
                self.notes = ""
            }
        }

        func createExerciseEntry() {
            
        }
        
        func updateExerciseEntry() {
            
        }
        
        func deleteExerciseEntry() {
            
        }
    }
}
