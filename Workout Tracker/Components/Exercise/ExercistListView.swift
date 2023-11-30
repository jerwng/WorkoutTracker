//
//  ExercistListView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-13.
//

import Foundation
import SwiftUI
import CoreData

struct ExerciseListView: View {
    @ObservedObject private var viewModel: ExerciseListViewModel

    init(context: NSManagedObjectContext, day: Day) {
        viewModel = ExerciseListViewModel(context: context, day: day)
    }

//    func initializeExerciseEntries() {
//        guard let day = days[3] else {
//            return
//        }
//        let dayId = day.id
//        
//        for exerciseRecord in exerciseRecords {
//            var exerciseExerciseEntries: [ExerciseEntry_MockData] = []
//            
//            for exerciseEntryId in exerciseRecord.value.exerciseEntryIds {
//                guard let exerciseEntry = exerciseEntries[exerciseEntryId] else {
//                    continue
//                }
//                exerciseExerciseEntries.append(exerciseEntry)
//            }
//            
//            if exerciseRecord.value.dayId == dayId {
//                exerciseEntriesByExercise[exerciseRecord.value.exerciseId] = exerciseExerciseEntries
//            }
//        }
//    }
    
    
    var body: some View {
        List{
            ForEach(viewModel.exerciseRows, id: \.self) {
                exerciseRow in
                // TODO: Implement exerciseEntries parameter
                ExerciseView(exercise: exerciseRow, exerciseEntries: [])
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color("Background"))
            }
        }
        .listStyle(.plain)
    }
}
