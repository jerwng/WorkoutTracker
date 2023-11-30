//
//  ExerciseView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-12.
//

import Foundation
import SwiftUI

struct ExerciseView: View {
    var exercise: Exercise
    var exerciseEntries: [ExerciseEntry_MockData] = []
    
    @State var isSheetOpen = false
    
    func handleTapGesture() {
        isSheetOpen = true
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text(exercise.exerciseName).font(.title2).fontWeight(.bold)
                
                ExerciseSetsAndRepRange(exercise: exercise)
                
                Spacer()
                Image(systemName: "plus.circle")
                    .padding(.trailing, 5.0).onTapGesture {
                        handleTapGesture()
                    }
                
            }
            
            HStack {
                VStack(alignment: .leading){
                    ForEach(exerciseEntries) {
                        exerciseEntry in
                        ExerciseEntryRow(
                            exerciseEntry: exerciseEntry,
                            exercise: exercise
                        )
                    }.padding(.leading, 15.0)
                    
                    if (!exercise.exerciseNotes.isEmpty) {
                        ExerciseNotes(exerciseNotes: exercise.exerciseNotes)
                    }
                }
                
                Spacer()
                
                VStack(alignment: .leading) {
                    ItalicFootnote(content: "Previous: ")
                    ForEach(exerciseEntries) {
                        exerciseEntry in
                        ExerciseEntryRow(exerciseEntry: exerciseEntry, isItalic: true
                        )
                    }
                }
                .padding(.bottom, 2.0)
              
                
            }
     
            Divider().background(Color(.black))
            
        }.sheet(isPresented: $isSheetOpen) {
            ExerciseInputSheet(
                isSheetOpen: $isSheetOpen,
                selectedExercise: exercise,
                selectedExerciseEntry: nil
            )
        }
    }
}

