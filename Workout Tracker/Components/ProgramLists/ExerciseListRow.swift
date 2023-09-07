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

    var body: some View {
        ListRow(
            title: exercise.name,
            description: ExerciseUtils.getExerciseSetsRepRangeString(
                            sets: exerciseSet.sets,
                            repRangeTop: exercise.repRangeTop,
                            repRangeBottom: exercise.repRangeBot
                            )
        ).padding(.bottom, 1)
    }
}
