//
//  CreateExerciseInputSheet.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-08.
//

import Foundation
import SwiftUI
import CoreData

struct CreateExerciseInputSheet: View {
    @ObservedObject private var viewModel: CreateExerciseInputSheetViewModel
    @Binding var isSheetOpen: Bool
    @State var isAlertPresented = false
    @State var alertMessage: String = ""
    
    init(context: NSManagedObjectContext, isSheetOpen: Binding<Bool>, selectedExercise: Exercise?, day: Day) {
        viewModel = CreateExerciseInputSheetViewModel(
            context: context,
            selectedExercise: selectedExercise,
            day: day
        )
        
        self._isSheetOpen = isSheetOpen
    }
    
    func handleExerciseInputSheetSubmit() {
        if let error = viewModel.handleCreateExerciseInputSheetSubmit() {
            alertMessage = error.localizedDescription
            isAlertPresented = true
        } else {
            isSheetOpen = false
        }
    }

    var body: some View {
        CreateExerciseInputSheetBody(
            isSheetOpen: $isSheetOpen,
            sets: $viewModel.sets,
            repRangeTop: $viewModel.repRangeTop,
            repRangeBot: $viewModel.repRangeBot,
            notes: $viewModel.notes,
            name: $viewModel.name,
            title: viewModel.title,
            handleSubmit: handleExerciseInputSheetSubmit
        ).alert(alertMessage, isPresented: $isAlertPresented) {
            Button("OK", role: .cancel) { }
        }
    }
}
