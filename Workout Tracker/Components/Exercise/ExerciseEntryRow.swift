//
//  ExerciseEntryRow.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-06-03.
//

import Foundation
import SwiftUI

struct ExerciseEntryRow: View {
    @Environment(\.managedObjectContext) var moc

    var exerciseEntry: ExerciseEntry
    // Exercise intended to be Optional. "Previous" exercise entry rows also use this view and does not provie an Exercise entity
    var exercise: Exercise?
    
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
        
        if (!exerciseEntry.exerciseEntryTime.isEmpty) {
            curExerciseEntryRowString += ", " + exerciseEntry.exerciseEntryTime
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
                if let _exercise = exercise {
                    ExerciseInputSheet(
                        context: moc,
                        isSheetOpen: $isSheetOpen,
                        selectedExercise: _exercise,
                        selectedExerciseEntry: exerciseEntry
                    )
                }
            }
        }
    }
}
