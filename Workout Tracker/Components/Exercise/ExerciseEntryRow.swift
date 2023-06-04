//
//  ExerciseEntryRow.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-06-03.
//

import Foundation
import SwiftUI

struct ExerciseEntryRow: View {
    var exerciseEntry: ExerciseEntry
    
    var isItalic: Bool? = false
    
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
            }
        }
    }
}
