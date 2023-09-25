//
//  File.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-23.
//

import Foundation

struct ExerciseEntry_MockData: Identifiable {
    var id: Int
    var reps: Int
    var weight: Int
    var time: String?
}

struct ExerciseEntries {
    let exerciseEntries = [
        0: ExerciseEntry_MockData(id: 0, reps: 8, weight: 225),
        1: ExerciseEntry_MockData(id: 1, reps: 6, weight: 225, time: "25:49"),
        2: ExerciseEntry_MockData(id: 2, reps: 13, weight: 110, time: "02:30"),
        3: ExerciseEntry_MockData(id: 3, reps: 11, weight: 110, time: "04:30")
    ]
}
