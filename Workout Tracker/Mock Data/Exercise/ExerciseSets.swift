//
//  ExerciseSets.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-23.
//

import Foundation

struct ExerciseSet_MockData: Identifiable {
    var id: Int
    var exerciseId: Exercise_MockData.ID
    var sets: Int
}

struct ExerciseSets {    
    let exerciseSets = [
        0: ExerciseSet_MockData(id: 0, exerciseId: 0, sets: 3),
        1: ExerciseSet_MockData(id: 1, exerciseId: 1, sets: 2),
        2: ExerciseSet_MockData(id: 2, exerciseId: 2, sets: 2),
        3: ExerciseSet_MockData(id: 3, exerciseId: 3, sets: 3),
        4: ExerciseSet_MockData(id: 4, exerciseId: 4, sets: 3)
    ]
}
