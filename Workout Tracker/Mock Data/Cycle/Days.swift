//
//  Days.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-23.
//

import Foundation

struct Day: Identifiable {
    var id: Int
    var dayName: String
    var exerciseSetIds: [ExerciseSet.ID]
}

// Day 3 on Microcycle 1 will have different id than Day 3 on Microcycle 2
struct Days {
    let days = [
        3: Day(id: 3, dayName: "Day 3", exerciseSetIds: [0,1,2,3,4,5])
    ]
}
