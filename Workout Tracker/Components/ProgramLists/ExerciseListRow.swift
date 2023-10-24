//
//  ExerciseListRow.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-07.
//

import Foundation
import SwiftUI

struct ExerciseListRow: View {
    var exercise: Exercise
    
    @State private var isSheetOpen: Bool = false
    
    func handleTapRow() {
        isSheetOpen = true
    }

    var body: some View {
        VStack(alignment: .leading) {
            ListRow(
                title: exercise.exerciseName,
                description: ExerciseUtils.getExerciseSetsRepRangeString(
                    sets: Int(exercise.sets),
                    repRangeTop: Int(exercise.repRangeTop),
                    repRangeBottom: Int(exercise.repRangeBot)
                                )
            )
            .onTapGesture {
                handleTapRow()
            }
            .sheet(isPresented: $isSheetOpen) {
                CreateExerciseInputSheet(
                    isSheetOpen: $isSheetOpen,
                    selectedExercise: exercise
                )
            }
            if let exerciseNotes = exercise.notes {
                ExerciseNotes(exerciseNotes: exerciseNotes).padding(
                    .leading, 15
                )
            }
        }.padding(.bottom, 1)
    }
}
