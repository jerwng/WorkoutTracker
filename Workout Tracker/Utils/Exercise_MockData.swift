//
//  Exercise.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-07.
//

import Foundation

struct ExerciseUtils {
    static func test() {
        print("hello3")
    }
    
    static func getExerciseSetById(exerciseSetId: ExerciseSet_MockData.ID) -> ExerciseSet_MockData? {
        let exerciseSets = ExerciseSets().exerciseSets
        
        return exerciseSets[exerciseSetId]
    }
    
    static func getExerciseById(exerciseId: Exercise_MockData.ID) -> Exercise_MockData? {
        let exercises = Exercises().exercises
        
        return exercises[exerciseId]
    }
    
    /**
     Build a string showing exercise's sets and rep range.
     For example, 3 sets of 8 to 12 reps returns "3 x 8-12"
     */
    static func getExerciseSetsRepRangeString(
        sets: Int,
        repRangeTop: Int,
        repRangeBottom: Int) -> String {
        return String(sets) + " x " +
                String(repRangeBottom) + "-" +
                String(repRangeTop)
    }
}
