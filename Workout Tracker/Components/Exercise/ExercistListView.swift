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
    
    var body: some View {
        List{
            ForEach(viewModel.exerciseRows, id: \.self) {
                exerciseRow in
                ExerciseView(
                    context: viewModel.context,
                    exercise: exerciseRow
                )
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color("Background"))
            }
        }
        .listStyle(.plain)
    }
}
