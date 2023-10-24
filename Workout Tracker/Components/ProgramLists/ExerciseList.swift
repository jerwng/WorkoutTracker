//
//  ExerciseList.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-07.
//

import Foundation
import SwiftUI

struct ExerciseList: View {
    var exercises: [Exercise]
    
    func handleDelete(at offsets: IndexSet) {
        print("delete exercise")
    }

    var body: some View {
        List {
            ForEach(exercises, id: \.self) {
                exercise in
                    ExerciseListRow(
                        exercise: exercise
                    )
                    .exerciseListListRowStylingModifier()
            }.onDelete(perform: handleDelete)
        }.listStyle(.plain)
    }
}

// Extend View to provide a convenient modifier function
extension View {
    func exerciseListListRowStylingModifier() -> some View {
        modifier(ListRowStylingModifier())
    }
}
