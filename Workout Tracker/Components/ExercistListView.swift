//
//  ExercistListView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-13.
//

import Foundation
import SwiftUI

struct ExerciseRow: Identifiable {
    let id: UUID
    let exerciseId: Exercise.ID
    let exerciseName: String
    let exerciseSets: Int
    
    init(exerciseId: Exercise.ID, exerciseName: String, exerciseSets: Int) {
        self.id = UUID()
        self.exerciseId = exerciseId
        self.exerciseName = exerciseName
        self.exerciseSets = exerciseSets
    }
}

struct ExerciseListView: View {
    let days = Days().days
    let exerciseSets = ExerciseSets().exerciseSets
    let exercises = Exercises().exercises
    let exerciseRecords = ExerciseRecords().exerciseRecords
    let exerciseEntries = ExerciseEntries().exerciseEntries
    
    @State var exerciseRows: [ExerciseRow] = []
    @State var exerciseEntriesByExercise: [Exercise.ID: [ExerciseEntry]] = [:]

    func initializeExercises() {
        guard let day = days[3] else {
            return
        }
          
        let dayExerciseSetIds = day.exerciseSetIds
        for dayExerciseSetId in dayExerciseSetIds {
            guard let exerciseSet = exerciseSets[dayExerciseSetId] else {
                continue
            }
                        
            guard let exercise = exercises[exerciseSet.exerciseId] else {
                continue
            }
            
            exerciseRows.append(ExerciseRow(exerciseId: exercise.id, exerciseName: exercise.name, exerciseSets: exerciseSet.sets))
        }
    }
    
    func initializeExerciseEntries() {
        guard let day = days[3] else {
            return
        }
        let dayId = day.id
        
        for exerciseRecord in exerciseRecords {
            var exerciseExerciseEntries: [ExerciseEntry] = []
            
            for exerciseEntryId in exerciseRecord.value.exerciseEntryIds {
                guard let exerciseEntry = exerciseEntries[exerciseEntryId] else {
                    continue
                }
                exerciseExerciseEntries.append(exerciseEntry)
            }
            
            if exerciseRecord.value.dayId == dayId {
                exerciseEntriesByExercise[exerciseRecord.value.exerciseId] = exerciseExerciseEntries
            }
        }
        
        print(exerciseEntriesByExercise)
    }
    
    
    var body: some View {
        List(exerciseRows) {
            exerciseRow in

            ExerciseView(exercise: exerciseRow, exerciseEntries: exerciseEntriesByExercise[exerciseRow.exerciseId] ?? []).listRowSeparator(.hidden)
                .listRowBackground(Color("Background"))
        }.onAppear{
            initializeExercises()
            initializeExerciseEntries()
        }
        .listStyle(.plain)
    }
}
