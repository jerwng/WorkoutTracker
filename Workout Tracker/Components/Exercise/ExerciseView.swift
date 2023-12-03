//
//  ExerciseView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-12.
//

import Foundation
import SwiftUI
import CoreData

struct ExerciseView: View {
    @ObservedObject var viewModel: ExerciseViewModel

    init(context: NSManagedObjectContext, exercise: Exercise) {
        viewModel = ExerciseViewModel(
            context: context,
            exercise: exercise
        )
    }
    
    func handleTapGesture() {
        viewModel.setIsSheetOpen(isSheetOpen: true)
    }
    
    func handleExerciseEntryCreate() {
        viewModel.initExerciseEntries()
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(viewModel.exercise.exerciseName).font(.title2).fontWeight(.bold)
                
                ExerciseSetsAndRepRange(exercise: viewModel.exercise)
                
                Spacer()
                Image(systemName: "plus.circle")
                    .padding(.trailing, 5.0).onTapGesture {
                        handleTapGesture()
                    }
            }
            
            HStack {
                VStack(alignment: .leading){
                    ForEach(viewModel.exerciseEntries) {
                        exerciseEntry in
                        ExerciseEntryRow(
                            exercise: viewModel.exercise,
                            exerciseEntry: exerciseEntry
                        )
                    }.padding(.leading, 15.0)
                    
                    if (!viewModel.exercise.exerciseNotes.isEmpty) {
                        ExerciseNotes(exerciseNotes: viewModel.exercise.exerciseNotes)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    ItalicFootnote(content: "Previous: ")
                    ForEach(viewModel.previousExerciseEntries) {
                        previousExerciseEntry in
                        ExerciseEntryRow(
                            exerciseEntry: previousExerciseEntry,
                            isItalic: true
                        )
                    }
                }
                .padding(.bottom, 2.0)
            }
     
            Divider().background(Color(.black))
            
        }.sheet(isPresented: $viewModel.isSheetOpen) {
            ExerciseInputSheet(
                context: viewModel.context,
                isSheetOpen: $viewModel.isSheetOpen,
                selectedExercise: viewModel.exercise,
                onExerciseEntryCreate: handleExerciseEntryCreate
            )
        }
    }
}

