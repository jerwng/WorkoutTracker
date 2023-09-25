//
//  ExerciseEntryRow.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-06-03.
//

import Foundation
import SwiftUI

struct ExerciseEntryRow: View {
    var exerciseEntry: ExerciseEntry_MockData
    var exercise: ExerciseRow?
    
    var isItalic: Bool? = false

    @State var isSheetOpen = false
    
    /**
     Inteded to only display sheet if exercise value is provided.
     */
    func handleTapGesture() {
        if (exercise != nil) {
            isSheetOpen = true
        }
    }
    
    @State var exerciseEntryRowString = ""
    
    func buildExerciseEntryRowString() {
        var curExerciseEntryRowString = String(exerciseEntry.reps) + " @ " + String(exerciseEntry.weight) + "lbs"
        
        if (exerciseEntry.time != nil) {
            curExerciseEntryRowString += ", " + exerciseEntry.time!
        }
        
        exerciseEntryRowString = curExerciseEntryRowString
    }
    
    var body: some View {
        
        if (isItalic == true) {
            ItalicFootnote(
                content: exerciseEntryRowString
            ).onAppear{
                buildExerciseEntryRowString()
            }
        } else {
            Text(exerciseEntryRowString).onAppear {
                buildExerciseEntryRowString()
            }.onTapGesture {
                handleTapGesture()
            }.sheet(isPresented: $isSheetOpen) {
                /**
                 Only render ExerciseEntryInputSheetBody if ExercisesGetter returns
                 a valid Exercise
                 */
                if let selectedExercise = ExercisesGetter(
                    exerciseId: exercise?.exerciseId ?? -1)
                {
                    ExerciseInputSheet(
                        isSheetOpen: $isSheetOpen,
                        selectedExercise: selectedExercise,
                        selectedExerciseEntry: exerciseEntry
                    )
                }
            }
        }
    }
}
