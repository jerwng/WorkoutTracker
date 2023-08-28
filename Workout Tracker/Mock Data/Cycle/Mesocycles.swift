//
//  Mesocycles.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-23.
//

import Foundation

struct Mesocycle: Identifiable {
    var id: Int
    var mesocycleName: String
    var microcycleIds: [Microcycle.ID]
    var isComplete: Bool
}

struct Mesocycles {
    let mesocycle = [0: Mesocycle(id: 0, mesocycleName: "Mesocycle 1", microcycleIds: [0, 1], isComplete: false)]
}
