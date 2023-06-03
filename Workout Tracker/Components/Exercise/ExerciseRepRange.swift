//
//  ExerciseRepRange.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-06-03.
//

import Foundation
import SwiftUI

struct ExerciseRepRange: View {
    var exercise: ExerciseRow
    
    @State var exerciseRepRangeString = ""
    
    func buildExerciseRepRangeString() {
        exerciseRepRangeString = String(exercise.exerciseRepRangeBot) + " to " + String(exercise.exerciseRepRangeTop) + " Reps"
    }
    
    var body: some View {
        ItalicFootnote(content: exerciseRepRangeString ).onAppear{
            buildExerciseRepRangeString()
        }
    }
}
