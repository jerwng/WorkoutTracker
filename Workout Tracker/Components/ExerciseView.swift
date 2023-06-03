//
//  ExerciseView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-12.
//

import Foundation
import SwiftUI

struct ExerciseView: View {
    var exercise: ExerciseRow
    var exerciseEntries: [ExerciseEntry] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(exercise.exerciseName).font(.title2).fontWeight(.bold)
                
                ItalicFootnote(content: "0 of " + String(exercise.exerciseSets))
            }
            
            VStack {
                ForEach(exerciseEntries) {
                    exerciseEntry in
                    Text(String(exerciseEntry.reps)) + Text(" @ ") +
                    Text(String(exerciseEntry.weight)) + Text("lbs")
                }
            }
            Divider().background(Color(.black))
            
        }
    }
}

