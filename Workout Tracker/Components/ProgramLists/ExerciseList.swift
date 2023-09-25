//
//  ExerciseList.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-07.
//

import Foundation
import SwiftUI

struct ExerciseList: View {
    var exerciseSetIds: [ExerciseSet_MockData.ID]
    
    func handleDelete(at offsets: IndexSet) {
        print("delete exercise")
    }

    var body: some View {
        List {
            ForEach(exerciseSetIds, id: \.self) {
                exerciseSetId in
                if let exerciseSet = ExerciseUtils
                        .getExerciseSetById(exerciseSetId:
                        exerciseSetId),
                    let exercise = ExerciseUtils
                        .getExerciseById(exerciseId:
                        exerciseSet.exerciseId) {
                    ExerciseListRow(
                        exercise: exercise,
                        exerciseSet: exerciseSet
                    )
                    .exerciseListListRowStylingModifier()
                }
            }.onDelete(perform: handleDelete)
        }.listStyle(.plain)
    }
}

// Extend View to provide a convenient modifier function
extension View {
    func exerciseListListRowStylingModifier() -> some View {
        modifier(ListRowStylingModifier())
    }
}
