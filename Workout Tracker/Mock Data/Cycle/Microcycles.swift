//
//  Microcycles.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-23.
//

import Foundation

struct Microcycle: Identifiable {
    var id: Int
    var microcycleName: String
    var dayIds: [Day.ID]
}

struct Microcycles {
    let microcycles = [
        0: Microcycle(
            id: 0,
            microcycleName: "Microcycle 1",
            dayIds: [1,2,3]
        ),
        1: Microcycle(
            id: 1,
            microcycleName: "Microcycle 2",
            dayIds: []
        )
    ]
}
