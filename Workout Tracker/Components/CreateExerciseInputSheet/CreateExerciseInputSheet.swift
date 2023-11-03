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
    
    init(context: NSManagedObjectContext, isSheetOpen: Binding<Bool>, selectedExercise: Exercise?, day: Day) {
        viewModel = CreateExerciseInputSheetViewModel(
            context: context,
            isSheetOpen: isSheetOpen,
            selectedExercise: selectedExercise,
            day: day
        )
    }

    var body: some View {
        CreateExerciseInputSheetBody(
            isSheetOpen: $viewModel.isSheetOpen,
            sets: $viewModel.sets,
            repRangeTop: $viewModel.repRangeTop,
            repRangeBot: $viewModel.repRangeBot,
            notes: $viewModel.notes,
            name: $viewModel.name,
            title: viewModel.title,
            handleSubmit: viewModel.handleCreateExerciseInputSheetSubmit
        )
    }
}
