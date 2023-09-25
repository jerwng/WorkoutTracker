//
//  Mesocycle.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-28.
//

import Foundation

struct MicrocycleUtils {
    static func test() {
        print("hello3")
    }
    
    static func getMicrocycleById(microcycleId: Microcycle_MockData.ID) -> Microcycle_MockData? {
        let microcycles = Microcycles().microcycles
        
        return microcycles[microcycleId]
    }
}
