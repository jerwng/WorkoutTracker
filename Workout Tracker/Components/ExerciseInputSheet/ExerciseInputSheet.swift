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
    @Binding var isSheetOpen: Bool
    @State var isAlertPresented: Bool
    @State var alertMessage: String = ""

    init(
        context: NSManagedObjectContext,
        isSheetOpen: Binding<Bool>,
        selectedExercise: Exercise,
        selectedExerciseEntry: ExerciseEntry? = nil,
        onExerciseEntryCreate: (() -> Void)? = nil,
        onExerciseEntryUpdate: (() -> Void)? = nil,
        onExerciseEntryDelete: (() -> Void)? = nil
    ) {
        viewModel = ExerciseInputSheetViewModel(
            context: context,
            selectedExercise: selectedExercise,
            selectedExerciseEntry: selectedExerciseEntry,
            onExerciseEntryCreate: onExerciseEntryCreate,
            onExerciseEntryUpdate: onExerciseEntryUpdate,
            onExerciseEntryDelete: onExerciseEntryDelete
        )
        
        self._isSheetOpen = isSheetOpen
        self.isAlertPresented = false
    }
    
    func handleSubmit() {
        if let error = viewModel.handleExerciseEntryInputSheetSubmit() {
            alertMessage = error.localizedDescription
            isAlertPresented = true
        } else {
            isSheetOpen = false
        }
    }
    
    func handleButtonTap() {
        viewModel.deleteExerciseEntry()
        isSheetOpen = false
    }
    
    var body: some View {
        VStack {
            ExerciseEntryInputSheetBody(
                isSheetOpen: $isSheetOpen,
                name: $viewModel.name,
                weight: $viewModel.weight,
                reps: $viewModel.reps,
                time: $viewModel.time,
                notes: $viewModel.notes,
                handleSubmit: handleSubmit
            ).alert(alertMessage, isPresented: $isAlertPresented) {
                Button("OK", role: .cancel) { }
            }
            
            Button("Delete Entry", action: handleButtonTap).foregroundColor(.red).padding(.bottom, 5.0)
        }
    }
    
}
