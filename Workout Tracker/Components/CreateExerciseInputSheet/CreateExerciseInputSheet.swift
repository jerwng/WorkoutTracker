//
//  CreateExerciseInputSheet.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-08.
//

import Foundation
import SwiftUI

struct CreateExerciseInputSheet: View {
    @Binding var isSheetOpen: Bool

    private let initialSets: String
    private let initialRepRangeTop: String
    private let initialRepRangeBot: String
    private let initialNotes: String
    private let initialName: String
    
    init(isSheetOpen: Binding<Bool>, selectedExercise: Exercise?, selectedExerciseSets: ExerciseSet?) {
        _isSheetOpen = isSheetOpen
        
        if let exercise = selectedExercise {
            self.initialName = exercise.name
            self.initialRepRangeTop = String(exercise.repRangeTop)
            self.initialRepRangeBot = String(exercise.repRangeBot)
            self.initialNotes = exercise.notes ?? ""
        } else {
            self.initialName = ""
            self.initialRepRangeTop = ""
            self.initialRepRangeBot = ""
            self.initialNotes = ""
        }
        
        if let exerciseSets = selectedExerciseSets {
            self.initialSets = String(exerciseSets.sets)
        } else {
            self.initialSets = ""
        }
    }

    var body: some View {
        Text("hello")
        Text(initialName)
        Text(initialSets)
        Text(initialRepRangeTop)
        Text(initialRepRangeBot)
    }
}
