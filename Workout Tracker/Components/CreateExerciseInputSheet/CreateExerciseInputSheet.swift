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

    @State private var sets: String
    @State private var repRangeTop: String
    @State private var repRangeBot: String
    @State private var notes: String
    @State private var name: String
    @State private var title: String
    
    init(isSheetOpen: Binding<Bool>, selectedExercise: Exercise?) {
        _isSheetOpen = isSheetOpen
        
        if let exercise = selectedExercise {
            self.name = exercise.exerciseName
            self.repRangeTop = String(exercise.repRangeTop)
            self.repRangeBot = String(exercise.repRangeBot)
            self.notes = exercise.exerciseNotes
            self.title = exercise.exerciseName
            self.sets = String(exercise.sets)
        } else {
            self.name = ""
            self.repRangeTop = ""
            self.repRangeBot = ""
            self.notes = ""
            self.title = "Add Exercise"
            self.sets = ""
        }
    }

    var body: some View {
        CreateExerciseInputSheetBody(
            isSheetOpen: $isSheetOpen,
            sets: $sets,
            repRangeTop: $repRangeTop,
            repRangeBot: $repRangeBot,
            notes: $notes,
            name: $name,
            title: title
        )
    }
}
