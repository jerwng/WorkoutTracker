//
//  ExerciseListViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-11-29.
//

import Foundation
import SwiftUI
import CoreData

extension ExerciseListView {
    @MainActor class ExerciseListViewModel: ObservableObject {
        let context: NSManagedObjectContext
        private let day: Day
        @Published var exerciseRows: [Exercise] = []
        
        init(context: NSManagedObjectContext, day: Day) {
            self.context = context
            self.day = day
            initExerciseRows()
        }
        
        func initExerciseRows() {
            setExerciseRows(exerciseRows: self.day.dayExercises)
        }
        
        func setExerciseRows(exerciseRows: [Exercise]) {
            self.exerciseRows = exerciseRows
        }
    }
}
