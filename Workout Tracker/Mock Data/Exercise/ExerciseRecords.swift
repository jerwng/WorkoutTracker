//
//  ExerciseRecord.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-19.
//

import Foundation

struct ExerciseRecord_MockData: Identifiable {
    var id: Int
    var exerciseId: Exercise_MockData.ID
    var dayId: Day_MockData.ID
    var exerciseEntryIds: [ExerciseEntry_MockData.ID]
    var notes: String = ""
}

struct ExerciseRecords {
    let exerciseRecords = [
        0: ExerciseRecord_MockData(id: 0, exerciseId: 0, dayId: 3, exerciseEntryIds: [0,1], notes: "Used smith machine squat"),
        1: ExerciseRecord_MockData(id: 1, exerciseId: 1, dayId: 3, exerciseEntryIds: [2,3])
    ]
}
