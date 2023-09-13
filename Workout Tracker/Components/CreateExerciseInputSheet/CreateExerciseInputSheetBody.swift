//
//  File.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-12.
//

import Foundation
import SwiftUI

struct CreateExerciseInputSheetBody: View {
    @Binding var isSheetOpen: Bool
    
    var sets: String
    var repRangeTop: String
    var repRangeBot: String
    var notes: String
    var name: String
    
    var body: some View {
        BaseExerciseInputSheetBody(
            content: CreateExerciseInputSheetFields(
                sets: sets,
                repRangeTop: repRangeTop,
                repRangeBot: repRangeBot,
                notes: notes,
                name: name
            ),
            sheetTitle: name,
            isSheetOpen: $isSheetOpen
        )
    }
}

struct CreateExerciseInputSheetFields : View {
    var sets: String
    var repRangeTop: String
    var repRangeBot: String
    var notes: String
    var name: String
    
    var body: some View {
        Form {
            Section {
                BackgroundTextField(
                    initialValue: name, textPlaceholder: "Name"
                )
                DecimalPadTextField(initialValue: sets, textPlaceholder: "Sets")

                DecimalPadTextField(
                    initialValue: repRangeBot, textPlaceholder: "Rep Range Bottom"
                )
                DecimalPadTextField(
                    initialValue: repRangeTop, textPlaceholder: "Rep Range Top"
                )
            }

            Section {
                BackgroundTextField(
                    initialValue: notes, textPlaceholder: "Notes"
                ).lineLimit(4, reservesSpace: true)
            }
        }
        .background(Color.white)
        .scrollContentBackground(.hidden) // This line is needed to change Form's background colour

    }
}
