//
//  DayViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-11-27.
//

import Foundation
import SwiftUI
import CoreData

extension DayView {
    @MainActor class DayViewModel: ObservableObject {
        private let context: NSManagedObjectContext
        @Published var selectedDay: Day?
        @Published var nextDay: Day?
        @Published var previousDay: Day?
        
        @AppStorage(UserDefaultKeys.lastVisitedDayId) var lastVisitedDayId: String = ""
        
        init(context: NSManagedObjectContext) {
            // Current default to Day 1 Week 1 (first day)
            self.context = context
            initializeSelectedDay()
        }
        
        func initializeSelectedDay() {
            let mesocycleFirstDay = fetchActiveMesocycleFirstDay()
            setSelectedDay(day: mesocycleFirstDay)
        }
        
        func setSelectedDay(day: Day?) {
            self.selectedDay = day
            
            lastVisitedDayId = day?.dayId ?? ""

            setNextDay()
            setPreviousDay()
        }
        
        func setNextDay() {
            self.nextDay = fetchNextDay()
        }
        
        func setPreviousDay() {
            self.previousDay = fetchPrevDay()
        }
        
        func handleTapNextDay() {
            if let nextDay = self.nextDay {
                setSelectedDay(day: nextDay)
            }
        }
        
        func handleTapPreviousDay() {
            if let previousDay = self.previousDay {
                setSelectedDay(day: previousDay)
            }
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
        func fetchNextDay() -> Day? {
            // Get current Day's sequence, if day with a larger sequence exists in microcycle, return
            let currentMicrocycle = selectedDay?.microcycle
            
            if (currentMicrocycle == nil || selectedDay == nil) {
                return nil
            }
            
            if let nextDayInMicrocycle =  currentMicrocycle!.getNextSequencedMicrocycleDay(day: selectedDay!) {
                return nextDayInMicrocycle
            }
            
            // Get current Microcycle's sequence, if microcycle with larger sequence exists in mesocycle, return day with lowest sequence
            let currentMesocycle = currentMicrocycle!.mesocycle
            
            if (currentMesocycle == nil) {
                return nil
            }
            
            if let nextMicrocycleInMesocycle = currentMesocycle!.getNextSequencedMesocycleMicrocycle(microcycle: currentMicrocycle!) {
                return nextMicrocycleInMesocycle.microcycleDays.first
            }
            
            return nil
        }
        
        /**
         Fetch the day before the selectedDay in the current active mesocycle
         */
        func fetchPrevDay() -> Day? {
            // Get current Day's sequence, return day with next smallest sequence, if exists
            let currentMicrocycle = selectedDay?.microcycle
            
            if (currentMicrocycle == nil || selectedDay == nil) {
                return nil
            }
            
            if let previousDayInMicrocycle =  currentMicrocycle!.getPreviousSequencedMicrocycleDay(day: selectedDay!) {
                return previousDayInMicrocycle
            }
            
            // Get current Microcycle's sequence, return last day of microcycle with next smallest sequence, if exists
            let currentMesocycle = currentMicrocycle!.mesocycle
            
            if (currentMesocycle == nil) {
                return nil
            }
            
            if let previousMicrocycleInMesocycle = currentMesocycle!.getPreviousSequencedMesocycleMicrocycle(microcycle: currentMicrocycle!) {
                return previousMicrocycleInMesocycle.microcycleDays.last
            }
            
            return nil
        }
    }
}
