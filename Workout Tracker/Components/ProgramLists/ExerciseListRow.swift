//
//  ExerciseListRow.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-07.
//

import Foundation
import SwiftUI
import CoreData

struct ExerciseListRow: View {
    var context: NSManagedObjectContext
    var exercise: Exercise
    var day: Day
    
    @State private var isSheetOpen: Bool = false
    
    func handleTapRow() {
        isSheetOpen = true
    }

    var body: some View {
        VStack(alignment: .leading) {
            ListRow(
                title: exercise.exerciseName,
                description: ExerciseUtils.getExerciseSetsRepRangeString(
                    sets: Int(exercise.sets),
                    repRangeTop: Int(exercise.repRangeTop),
                    repRangeBottom: Int(exercise.repRangeBot)
                                )
            )
            .onTapGesture {
                handleTapRow()
            }
            .sheet(isPresented: $isSheetOpen) {
                CreateExerciseInputSheet(
                    context: context,
                    isSheetOpen: $isSheetOpen,
                    selectedExercise: exercise,
                    day: day
                )
            }
            if let exerciseNotes = exercise.notes {
                ExerciseNotes(exerciseNotes: exerciseNotes).padding(
                    .leading, 15
                )
            }
        }.padding(.bottom, 1)
    }
}
