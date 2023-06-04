//
//  ExerciseRepRange.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-06-03.
//

import Foundation
import SwiftUI

struct ExerciseSetsAndRepRange: View {
    var exercise: ExerciseRow
    
    @State var exerciseRepRangeString = ""

    func buildExerciseRepRangeString() {        
        exerciseRepRangeString = String(exercise.exerciseRepRangeBot) + "-" + String(exercise.exerciseRepRangeTop)
    }
    
    var body: some View {
        ItalicFootnote(content: String(exercise.exerciseSets) + " x " + exerciseRepRangeString).onAppear{
            buildExerciseRepRangeString()
        }
    }
}
