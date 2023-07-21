//
//  Exercises.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-10.
//

import Foundation

struct Exercise: Identifiable {
    var id: Int
    var name: String
    var repRangeBot: Int
    var repRangeTop: Int
    var notes: String?
}

struct Exercises {
    let exercises = [
        0: Exercise(id: 0, name: "Squat", repRangeBot: 6, repRangeTop: 8),
        1: Exercise(id: 1, name: "Leg Extension", repRangeBot: 8, repRangeTop: 12),
        2: Exercise(id: 2, name: "Seated Leg Curl", repRangeBot: 5, repRangeTop: 10),
        3: Exercise(id: 3, name: "Seated Calf Raise", repRangeBot: 8, repRangeTop: 12, notes: "Remember to go slow on descend"),
        4: Exercise(id: 4, name: "Hanging Leg Raise", repRangeBot: 5, repRangeTop: 10, notes: "Dropset")
    ]
}

func ExercisesGetter(exerciseId: Exercise.ID) -> Exercise? {
    let exercises =  Exercises().exercises
    
    return exercises[exerciseId]
}
