//
//  ExerciseInputSheet.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-03.
//

import Foundation
import SwiftUI
import CoreData

struct ExerciseInputSheet: View {
    @ObservedObject private var viewModel: ExerciseInputSheetViewModel

    init(
        context: NSManagedObjectContext,
        isSheetOpen: Binding<Bool>,
        selectedExercise: Exercise,
        selectedExerciseEntry: ExerciseEntry? = nil,
        onExerciseEntryCreate: (() -> Void)? = nil,
        onExerciseEntryUpdate: (() -> Void)? = nil
    ) {
        viewModel = ExerciseInputSheetViewModel(
            context: context,
            isSheetOpen: isSheetOpen,
            selectedExercise: selectedExercise,
            selectedExerciseEntry: selectedExerciseEntry,
            onExerciseEntryCreate: onExerciseEntryCreate,
            onExerciseEntryUpdate: onExerciseEntryUpdate
        )
    }
    
    func handleSubmit() {
        viewModel.handleExerciseEntryInputSheetSubmit()
    }
    
    func handleButtonTap() {
        print("tap delete exercise entry button")
    }
    
    var body: some View {
        VStack {
            ExerciseEntryInputSheetBody(
                isSheetOpen: $viewModel.isSheetOpen,
                name: $viewModel.name,
                weight: $viewModel.weight,
                reps: $viewModel.reps,
                time: $viewModel.time,
                notes: $viewModel.notes,
                handleSubmit: handleSubmit
            )
            
            Button("Delete Entry", action: handleButtonTap).foregroundColor(.red).padding(.bottom, 5.0)
        }
    }
    
}
