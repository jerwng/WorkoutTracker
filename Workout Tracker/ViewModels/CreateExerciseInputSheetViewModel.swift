//
//  CreateExerciseInputSheetViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-11-03.
//

import Foundation
import SwiftUI
import CoreData

extension CreateExerciseInputSheet {
    @MainActor class CreateExerciseInputSheetViewModel: ObservableObject {
        private let context: NSManagedObjectContext
        
        @Binding var isSheetOpen: Bool
        
        @Published var day: Day
        
        @Published var sets: String
        @Published var repRangeTop: String
        @Published var repRangeBot: String
        @Published var notes: String
        @Published var name: String
        @Published var title: String
        
        var isNewExercise: Bool
        
        private let selectedExercise: Exercise?
        
        init(context: NSManagedObjectContext, isSheetOpen: Binding<Bool>, selectedExercise: Exercise?, day: Day) {
            self.context = context
            self.day = day
            self._isSheetOpen = isSheetOpen
            self.selectedExercise = selectedExercise
            
            if let exercise = selectedExercise {
                self.name = exercise.exerciseName
                self.repRangeTop = String(exercise.repRangeTop)
                self.repRangeBot = String(exercise.repRangeBot)
                self.notes = exercise.exerciseNotes
                self.title = exercise.exerciseName
                self.sets = String(exercise.sets)
                isNewExercise = false
            } else {
                self.name = ""
                self.repRangeTop = ""
                self.repRangeBot = ""
                self.notes = ""
                self.title = "Add Exercise"
                self.sets = ""
                isNewExercise = true
            }
        }
        
        func handleCreateExerciseInputSheetSubmit() {
            if (isNewExercise) {
                createExerciseToSelectedDay()
            } else {
                updateExercise()
            }
        }
        
        func createExerciseToSelectedDay() {
            if (sets.isEmpty || repRangeBot.isEmpty || repRangeTop.isEmpty || name.isEmpty) {
                return
            }
            
            if let newExercise = Exercise.create(
                context: context,
                name: name,
                notes: notes,
                repRangeTop: Int16(repRangeTop)!,
                repRangeBot: Int16(repRangeBot)!,
                sets: Int16(sets)!
            ) {
                day.addExercise(newExercise: newExercise)
                self.day = day
            }
        }
        
        func updateExercise() {
            if (sets.isEmpty || repRangeBot.isEmpty || repRangeTop.isEmpty || name.isEmpty) {
                return
            }
            
            selectedExercise?.update(
                context: context,
                newName: name,
                newNotes: notes,
                newRepRangeTop: Int16(repRangeTop)!,
                newRepRangeBot: Int16(repRangeBot)!,
                newSets: Int16(sets)!
            )
        }
    }
}
