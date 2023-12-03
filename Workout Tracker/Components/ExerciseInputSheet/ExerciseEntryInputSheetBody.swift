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
    @Binding var name: String
    @Binding var weight: String
    @Binding var reps: String
    @Binding var time: String
    @Binding var notes: String
    
    var handleSubmit: () -> Void
    
    var body: some View {
        BaseExerciseInputSheetBody(
            content: ExerciseEntryInputSheetFields(
                weight: $weight,
                reps: $reps,
                time: $time,
                notes: $notes
            ),
            sheetTitle: name,
            isSheetOpen: $isSheetOpen,
            handleSubmit: handleSubmit
        )
    }
}

struct ExerciseEntryInputSheetFields: View {
    @Binding var weight: String
    @Binding var reps: String
    @Binding var time: String
    @Binding var notes: String

    var body: some View {
        Form {
            Section {
                DecimalPadTextField(
                    textValue: $weight, textPlaceholder: "lbs"
                )
                DecimalPadTextField(
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
