//
//  DayViewViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-11-27.
//

import Foundation
import SwiftUI
import CoreData

extension DayView {
    @MainActor class DayViewViewModel: ObservableObject {
        private let context: NSManagedObjectContext
        @Published var selectedDay: Day?
        
        init(context: NSManagedObjectContext) {
            // Current default to Day 1 Week 1 (first day)
            self.context = context
            setSelectedDay()
        }
        
        func setSelectedDay() {
            self.selectedDay = fetchActiveMesocycleFirstDay()
        }

        /**
         Fetch the first day in the current active mesocycle
         */
        func fetchActiveMesocycleFirstDay() -> Day? {
            // Get active mesocycle. Return day with smallest sequence from microcycle with the smallest sequence in the active mesocycle
            let fetchRequest = FetchRequestUtils.getActiveMesocycleFetchRequest()
            
            do {
                let fetchResult = try context.fetch(fetchRequest)
                let activeMesocycle = !(fetchResult.isEmpty) ? fetchResult[0] : nil
                
                if (activeMesocycle == nil) {
                    return nil
                }

                if (activeMesocycle!.mesocycleMicrocycles.isEmpty) {
                    return nil
                }
                
                // mesocycleMicrocycles and microcycleDays properties are sorted by sequence
                // get smallest sequence by accessing the first element
                let smallestSequenceMicrocycle = activeMesocycle!.mesocycleMicrocycles[0]
                
                if (smallestSequenceMicrocycle.microcycleDays.isEmpty) {
                    return nil
                }

                return smallestSequenceMicrocycle.microcycleDays[0]
            } catch {
                print("Error fetching active mesocycle's first day: \(error)")
            }
            
            return nil
        }
        
        /**
         Fetch the day in the current active mesocycle by ID
         */
        func fetchActiveMesocycleDayById() {
            // Return day with matching ID. Ensure the day is from a microcycle in the active mesocycle.
            
        }
        
        /**
         Fetch the day after the selectedDay in the current active mesocycle
         */
        func fetchNextDay() {
            // Get current Day's sequence, if day with a larger sequence exists in microcycle, return
            
            // Get current Microcycle's sequence, if microcycle with larger sequence exists in mesocycle, return day with lowest sequence
        }
        
        /**
         Fetch the day before the selectedDay in the current active mesocycle
         */
        func fetchPrevDay() {
            // Get current Day's sequence, return day with next smallest sequence, if exists
            
            // Get current Microcycle's sequence, return last day of microcycle with next smallest sequence, if exists
            
        }
    }
}
