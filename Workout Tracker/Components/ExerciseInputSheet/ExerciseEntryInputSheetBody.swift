//
//  ExerciseEntryInputSheetBody.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-06-11.
//

import Foundation
import SwiftUI

struct ExerciseEntryInputSheetBody: View {
    @Binding var isSheetOpen: Bool
    var selectedExercise: Exercise
    
    var body: some View {
        BaseExerciseInputSheetBody(
            content: ExerciseEntryInputSheetFields(),
            sheetTitle: selectedExercise.name,
            isSheetOpen: $isSheetOpen
        )
    }
}

struct ExerciseEntryInputSheetFields: View {
    @State private var weight: String = ""
    @State private var reps: String = ""
    @State private var time: String = ""
    @State private var notes: String = ""
    

    var body: some View {
        Form {
            Section {
                BackgroundTextField(
                    textValue: $weight, textPlaceholder: "lbs"
                )
                BackgroundTextField(
                    textValue: $reps, textPlaceholder: "Reps"
                )
                BackgroundTextField(
                    textValue: $time, textPlaceholder: "Time"
                )
            }
            
            Section {
                BackgroundTextField(
                    textValue: $notes, textPlaceholder: "Notes"
                ).lineLimit(4, reservesSpace: true)
            }
        }
    }
}
