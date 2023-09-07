//
//  ExerciseList.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-07.
//

import Foundation
import SwiftUI

struct ExerciseList: View {
    var exerciseSetIds: [ExerciseSet.ID]

    var body: some View {
        VStack {
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
                }
            }
        }
    }
}
