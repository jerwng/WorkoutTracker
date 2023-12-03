//
//  EntityListViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-11-07.
//

import Foundation
import SwiftUI
import CoreData

extension EntityListView {
    @MainActor class EntityListViewModel: ObservableObject {
        private let context: NSManagedObjectContext
        
        @Published var mesocycles: [Mesocycle] = []
        @Published var microcycles: [Microcycle] = []
        @Published var days: [Day] = []
        @Published var exercises: [Exercise] = []
        @Published var exerciseEntries: [ExerciseEntry] = []
        
        init(context: NSManagedObjectContext) {
            self.context = context
            initializeEntities()
        }
        
        func handleDeleteMesocycle(index: Int) {
            let mesocycleToBeDeleted = mesocycles[index]
            mesocycleToBeDeleted.delete()
            initializeEntities()
        }
        
        func handleDeleteMicrocycle(index: Int) {
            let microcycleToBeDeleted = microcycles[index]
            microcycleToBeDeleted.delete()
            initializeEntities()
        }
        
        func handleDeleteDay(index: Int) {
            let dayToBeDeleted = days[index]
            dayToBeDeleted.delete()
            initializeEntities()
        }
        
        func handleDeleteExercise(index: Int) {
            let exerciseToBeDeleted = exercises[index]
            exerciseToBeDeleted.delete()
            initializeEntities()
        }
        
        func handleDeleteExerciseEntry(index: Int) {
            let exerciseEntryToBeDeleted = exerciseEntries[index]
            exerciseEntryToBeDeleted.delete()
            initializeEntities()
        }
        
        func initializeEntities() {
            self.mesocycles = fetchAllMesocycles()
            self.microcycles = fetchAllMicrocycles()
            self.days = fetchAllDays()
            self.exercises = fetchAllExercises()
            self.exerciseEntries = fetchAllExerciseEntries()
        }
        
        func fetchAllMesocycles() -> [Mesocycle] {
            let fetchRequest: NSFetchRequest<Mesocycle> = Mesocycle.fetchRequest()
            
            do {
                let fetchResult = try context.fetch(fetchRequest)
                return fetchResult
              
            } catch {
                print("Error fetching mesocycles: \(error)")
            }
            
            return []
        }
        
        func fetchAllMicrocycles() -> [Microcycle] {
            let fetchRequest: NSFetchRequest<Microcycle> = Microcycle.fetchRequest()
            
            do {
                let fetchResult = try context.fetch(fetchRequest)
                return fetchResult
              
            } catch {
                print("Error fetching microcycles: \(error)")
            }
            
            return []
        }
        
        func fetchAllDays() -> [Day] {
            let fetchRequest: NSFetchRequest<Day> = Day.fetchRequest()
            
            do {
                let fetchResult = try context.fetch(fetchRequest)
                return fetchResult
              
            } catch {
                print("Error fetching days: \(error)")
            }
            
            return []
        }
        
        func fetchAllExercises() -> [Exercise] {
            let fetchRequest: NSFetchRequest<Exercise> = Exercise.fetchRequest()
            
            do {
                let fetchResult = try context.fetch(fetchRequest)
                return fetchResult
              
            } catch {
                print("Error fetching exercises: \(error)")
            }
            
            return []
        }
        
        func fetchAllExerciseEntries() -> [ExerciseEntry] {
            let fetchRequest: NSFetchRequest<ExerciseEntry> = ExerciseEntry.fetchRequest()
            
            do {
                let fetchResult = try context.fetch(fetchRequest)
                return fetchResult
              
            } catch {
                print("Error fetching exercise entries: \(error)")
            }
            
            return []
        }
    }
}
