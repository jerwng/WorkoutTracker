//
//  ExerciseRepRange.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-06-03.
//

import Foundation
import SwiftUI

struct ExerciseSetsAndRepRange: View {
    var exercise: Exercise
    
    @State var exerciseRepRangeString = ""

    func buildExerciseRepRangeString() {        
        exerciseRepRangeString = String(exercise.repRangeBot) + "-" + String(exercise.repRangeTop)
    }
    
    var body: some View {
        ItalicFootnote(content: String(exercise.sets) + " x " + exerciseRepRangeString).onAppear{
            buildExerciseRepRangeString()
        }
    }
}
