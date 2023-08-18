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
    var name: String

    var weight: String?
    var reps: String?
    var time: String?
    var notes: String?
    
    var body: some View {
        BaseExerciseInputSheetBody(
            content: ExerciseEntryInputSheetFields(
                weight: weight,
                reps: reps,
                time: time,
                notes: notes
            ),
            sheetTitle: name,
            isSheetOpen: $isSheetOpen
        )
    }
}

struct ExerciseEntryInputSheetFields: View {
    var weight: String?
    var reps: String?
    var time: String?
    var notes: String?
    

    var body: some View {
        Form {
            Section {
                DecimalPadTextField(
                    initialValue: weight, textPlaceholder: "lbs"
                )
                DecimalPadTextField(
                    initialValue: reps, textPlaceholder: "Reps"
                )
                BackgroundTextField(
                    initialValue: time, textPlaceholder: "Time"
                )
            }
            
            Section {
                BackgroundTextField(
                    initialValue: notes, textPlaceholder: "Notes"
                ).lineLimit(4, reservesSpace: true)
            }
        }
    }
}
