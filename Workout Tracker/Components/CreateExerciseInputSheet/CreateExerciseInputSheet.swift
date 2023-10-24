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
    private let initialTitle: String
    
    init(isSheetOpen: Binding<Bool>, selectedExercise: Exercise?) {
        _isSheetOpen = isSheetOpen
        
        if let exercise = selectedExercise {
            self.initialName = exercise.exerciseName
            self.initialRepRangeTop = String(exercise.repRangeTop)
            self.initialRepRangeBot = String(exercise.repRangeBot)
            self.initialNotes = exercise.exerciseNotes
            self.initialTitle = exercise.exerciseName
            self.initialSets = String(exercise.sets)
        } else {
            self.initialName = ""
            self.initialRepRangeTop = ""
            self.initialRepRangeBot = ""
            self.initialNotes = ""
            self.initialTitle = "Add Exercise"
            self.initialSets = ""
        }
    }

    var body: some View {
        CreateExerciseInputSheetBody(
            isSheetOpen: $isSheetOpen,
            sets: initialSets,
            repRangeTop: initialRepRangeTop,
            repRangeBot: initialRepRangeBot,
            notes: initialNotes,
            name: initialName,
            title: initialTitle
        )
    }
}
