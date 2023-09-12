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
    var exerciseSet: ExerciseSet
    
    @State private var isSheetOpen: Bool = false
    
    func handleTapRow() {
        isSheetOpen = true
    }

    var body: some View {
        VStack(alignment: .leading) {
            ListRow(
                title: exercise.name,
                description: ExerciseUtils.getExerciseSetsRepRangeString(
                                sets: exerciseSet.sets,
                                repRangeTop: exercise.repRangeTop,
                                repRangeBottom: exercise.repRangeBot
                                )
            )
            .onTapGesture {
                handleTapRow()
            }
            .sheet(isPresented: $isSheetOpen) {
                CreateExerciseInputSheet(
                    isSheetOpen: $isSheetOpen,
                    selectedExercise: exercise,
                    selectedExerciseSets: exerciseSet
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
