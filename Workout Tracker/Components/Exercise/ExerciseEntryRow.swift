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
    
    @State var exerciseEntryRowString = ""
    
    func buildExerciseEntryRowString() {
        var curExerciseEntryRowString = String(exerciseEntry.reps) + " @ " + String(exerciseEntry.weight)
        
        if (exerciseEntry.time != nil) {
            curExerciseEntryRowString += ", " + exerciseEntry.time!
        }
        
        exerciseEntryRowString = curExerciseEntryRowString
    }
    
    var body: some View {
        Text(exerciseEntryRowString).onAppear {
            buildExerciseEntryRowString()
        }
    }
}
