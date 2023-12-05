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
        
        @Published var day: Day
        
        @Published var sets: String
        @Published var repRangeTop: String
        @Published var repRangeBot: String
        @Published var notes: String
        @Published var name: String
        @Published var title: String
        
        var onExerciseCreate: (() -> Void)?
        var onExerciseUpdate: (() -> Void)?
        
        var isNewExercise: Bool
        
        private let selectedExercise: Exercise?
        
        init(
            context: NSManagedObjectContext,
            selectedExercise: Exercise?,
            day: Day,
            onExerciseCreate: (() -> Void)? = nil,
            onExerciseUpdate: (() -> Void)? = nil
        ) {
            self.context = context
            self.day = day
            self.selectedExercise = selectedExercise
            
            self.onExerciseCreate = onExerciseCreate
            self.onExerciseUpdate = onExerciseUpdate
            
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
        
        func handleCreateExerciseInputSheetSubmit() -> Error? {
            do {
                if (isNewExercise) {
                    try createExerciseToSelectedDay()
                    if let _onExerciseCreate = onExerciseCreate {
                        _onExerciseCreate()
                    }
                } else {
                    try updateExercise()
                    if let _onExerciseUpdate = onExerciseUpdate {
                        _onExerciseUpdate()
                    }
                }
            } catch {
                return error
            }
            
            return nil
        }
        
        func createExerciseToSelectedDay() throws {
            if (sets.isEmpty || repRangeBot.isEmpty || repRangeTop.isEmpty || name.isEmpty) {
                throw ErrorConstants.setsAndRepRangeAndNameFieldEmpty
            }
            
            let dayExercisesWithCurrentName = day.dayExercises .filter {$0.exerciseName.localizedCaseInsensitiveContains(name)}
            if (!dayExercisesWithCurrentName.isEmpty) {
                throw ErrorConstants.exerciseWithNameExistsInDay
            }
            
            if let newExercise = Exercise.create(
                context: context,
                dayId: day.id,
                name: name,
                notes: notes,
                repRangeTop: Int16(repRangeTop)!,
                repRangeBot: Int16(repRangeBot)!,
                sets: Int16(sets)!
            ) {
                day.addExercise(newExercise: newExercise)
            }
        }
        
        func updateExercise() throws {
            if (sets.isEmpty || repRangeBot.isEmpty || repRangeTop.isEmpty || name.isEmpty) {
                throw ErrorConstants.setsAndRepRangeAndNameFieldEmpty
            }
            
            let dayExercisesWithCurrentName = day.dayExercises .filter {$0.exerciseName.localizedCaseInsensitiveContains(name)}
            if (!dayExercisesWithCurrentName.isEmpty) {
                throw ErrorConstants.exerciseWithNameExistsInDay
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
