//
//  DayProgramViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-25.
//

import Foundation
import SwiftUI
import CoreData

extension DayProgramView {
    @MainActor class DayProgramViewModel: ObservableObject {
        private let context: NSManagedObjectContext
        
        @Published var day: Day?
        
        init(context: NSManagedObjectContext, dayId: Day.ID) {
            self.context = context
            self.day = fetchDayById(dayId: dayId)
        }
        
        // ---------------------------------------- Selected Day Functions ----------------------------------------
        func getSelectedDayExercises() -> [Exercise] {
            return day?.dayExercises ?? []
        }

        // ---------------------------------------- CRUD Days ----------------------------------------
        func fetchDayById(dayId: Day.ID) -> Day? {
            if let _dayId = dayId {
                let fetchRequest: NSFetchRequest<Day> = Day.fetchRequest()
                fetchRequest.predicate = NSPredicate(format: "id == %@", _dayId.uuidString)
                
                do {
                    let results = try context.fetch(fetchRequest)
                    if (!results.isEmpty) {
                        return results[0]
                    }

                } catch {
                    print("Error fetching Day \(_dayId.uuidString): \(error)")
                }
            }

            return nil
        }
        
    }
}
