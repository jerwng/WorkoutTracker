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
        
        init(context: NSManagedObjectContext, isSheetOpen: Binding<Bool>, selectedExercise: Exercise?, day: Day) {
            self.context = context
            self.day = day
            self._isSheetOpen = isSheetOpen
            
            if let exercise = selectedExercise {
                self.name = exercise.exerciseName
                self.repRangeTop = String(exercise.repRangeTop)
                self.repRangeBot = String(exercise.repRangeBot)
                self.notes = exercise.exerciseNotes
                self.title = exercise.exerciseName
                self.sets = String(exercise.sets)
            } else {
                self.name = ""
                self.repRangeTop = ""
                self.repRangeBot = ""
                self.notes = ""
                self.title = "Add Exercise"
                self.sets = ""
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
    }
}
