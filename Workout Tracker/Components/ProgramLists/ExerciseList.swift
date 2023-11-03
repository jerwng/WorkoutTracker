//
//  ExerciseList.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-07.
//

import Foundation
import SwiftUI
import CoreData

struct ExerciseList: View {
    var context: NSManagedObjectContext
    var exercises: [Exercise]
    var day: Day
    
    func handleDelete(at offsets: IndexSet) {
        print("delete exercise")
        let exerciseToBeDeleted = exercises[offsets.first!]
        
        exerciseToBeDeleted.delete()
    }

    var body: some View {
        List {
            ForEach(exercises, id: \.self) {
                exercise in
                    ExerciseListRow(
                        context: context,
                        exercise: exercise,
                        day: day
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
