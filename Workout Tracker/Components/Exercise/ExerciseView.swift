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
                
                ExerciseSetsAndRepRange(exercise: exercise)
            }
            
            VStack(alignment: .leading){
                ForEach(exerciseEntries) {
                    exerciseEntry in
                    ExerciseEntryRow(exerciseEntry: exerciseEntry)
                }.padding(.leading, 15.0)
                
                if (exercise.exerciseNotes != nil) {
                    ExerciseNotes(exerciseNotes: exercise.exerciseNotes!)
                }
            }
            Divider().background(Color(.black))
            
        }
    }
}

