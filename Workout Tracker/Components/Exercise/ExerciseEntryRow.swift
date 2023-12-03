//
//  ExerciseEntryRow.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-06-03.
//

import Foundation
import SwiftUI

struct ExerciseEntryRow: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var viewModel: ExerciseEntryRowViewModel
    
    init(
        exercise: Exercise? = nil,
        exerciseEntry: ExerciseEntry,
        isItalic: Bool = false
    ) {
        viewModel = ExerciseEntryRowViewModel(
            exercise: exercise,
            exerciseEntry: exerciseEntry,
            isItalic: isItalic
        )
    }
    
    /**
     Inteded to only display sheet if exercise value is provided.
     */
    func handleTapGesture() {
        if (viewModel.exercise != nil) {
            viewModel.setIsSheetOpen(isSheetOpen: true)
        }
    }
    
    var body: some View {
        
        if (viewModel.isItalic == true) {
            ItalicFootnote(
                content: viewModel.buildExerciseEntryRowString()
            )
        } else {
            Text(viewModel.buildExerciseEntryRowString()).onTapGesture {
                handleTapGesture()
            }.sheet(isPresented: $viewModel.isSheetOpen) {
                if let _exercise = viewModel.exercise {
                    ExerciseInputSheet(
                        context: moc,
                        isSheetOpen: $viewModel.isSheetOpen,
                        selectedExercise: _exercise,
                        selectedExerciseEntry: viewModel.exerciseEntry
                    )
                }
            }
        }
    }
}
