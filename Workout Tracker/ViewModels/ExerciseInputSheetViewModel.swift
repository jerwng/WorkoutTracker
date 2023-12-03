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
        
        private var isNewExerciseEntry: Bool
        
        var onExerciseEntryCreate: (() -> Void)?
        var onExerciseEntryUpdate: (() -> Void)?
        var onExerciseEntryDelete: (() -> Void)?
        
        init(
            context: NSManagedObjectContext,
            isSheetOpen: Binding<Bool>,
            selectedExercise: Exercise,
            selectedExerciseEntry: ExerciseEntry?,
            onExerciseEntryCreate: (() -> Void)? = nil,
            onExerciseEntryUpdate: (() -> Void)? = nil,
            onExerciseEntryDelete: (() -> Void)? = nil
        ) {
            self.context = context
            self.selectedExercise = selectedExercise
            self.selectedExerciseEntry = selectedExerciseEntry
            
            self._isSheetOpen = isSheetOpen
            self.name = selectedExercise.exerciseName
            
            self.onExerciseEntryCreate = onExerciseEntryCreate
            self.onExerciseEntryUpdate = onExerciseEntryUpdate
            self.onExerciseEntryDelete = onExerciseEntryDelete

            if let _selectedExerciseEntry = selectedExerciseEntry {
                self.weight = String(_selectedExerciseEntry.weight)
                self.reps = String(_selectedExerciseEntry.reps)
                self.time = _selectedExerciseEntry.exerciseEntryTime
                self.notes = _selectedExerciseEntry.exerciseEntryNotes
                
                isNewExerciseEntry = false
            } else {
                self.weight = ""
                self.reps = ""
                self.time = ""
                self.notes = ""
                
                isNewExerciseEntry = true
            }
        }
        
        func handleExerciseEntryInputSheetSubmit() {
            if (isNewExerciseEntry) {
                createExerciseEntry()
                if let _onExerciseEntryCreate = onExerciseEntryCreate {
                    _onExerciseEntryCreate()
                }
                
            } else {
                updateExerciseEntry()
                if let _onExerciseEntryUpdate = onExerciseEntryUpdate {
                    _onExerciseEntryUpdate()
                }
            }
        }

        func createExerciseEntry() {
            if (reps.isEmpty || weight.isEmpty) {
                return
            }
            
            if let newExerciseEntry = ExerciseEntry.create(
                context: context,
                exercise: selectedExercise,
                reps: Int16(reps)!,
                weight: Int16(weight)!,
                time: time,
                notes: notes
            ) {
                selectedExercise.addExerciseEntry(exerciseEntry: newExerciseEntry)
                self.selectedExercise = selectedExercise
            }
        }
        
        func updateExerciseEntry() {
            if (reps.isEmpty || weight.isEmpty) {
                return
            }
            
            selectedExerciseEntry?.update(
                newReps: Int16(reps)!,
                newWeight: Int16(weight)!,
                newTime: time,
                newNotes: notes
            )
        }
        
        func deleteExerciseEntry() {
            if let _selectedExerciseEntry = selectedExerciseEntry {
                _selectedExerciseEntry.delete()

                if let _onExerciseEntryDelete = onExerciseEntryDelete {
                    _onExerciseEntryDelete()
                }
                
                self.isSheetOpen = false
            }
        }
    }
}
