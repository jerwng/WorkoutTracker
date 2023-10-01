//
//  Mesocycle+Extensions.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-28.
//

import Foundation
import CoreData

extension Microcycle {
    var microcycleName: String {
        return "\(name ?? "Unknown Microcycle")"
    }
    
    var micorcycleDays: [Day] {
        let daysSet = days as? Set<Day> ?? []
        
        return daysSet.sorted {
            $0.sequence < $1.sequence
        }
    }
}
