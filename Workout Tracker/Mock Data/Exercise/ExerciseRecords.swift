//
//  ExerciseRecord.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-19.
//

import Foundation

struct ExerciseRecord: Identifiable {
    var id: Int
    var exerciseId: Exercise.ID
    var dayId: Day.ID
    var exerciseEntryIds: [ExerciseEntry.ID]
    var notes: String = ""
}

struct ExerciseRecords {
    let exerciseRecords = [
        0: ExerciseRecord(id: 0, exerciseId: 0, dayId: 3, exerciseEntryIds: [0,1], notes: "Used smith machine squat"),
        1: ExerciseRecord(id: 1, exerciseId: 1, dayId: 3, exerciseEntryIds: [2,3])
    ]
}
