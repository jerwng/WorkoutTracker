//
//  Mesocycle.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-28.
//

import Foundation

struct MesocycleUtils {
    static func test() {
        print("hello3")
    }
    
    static func getMesocycleMicrocycles(mesocycle: Mesocycle) -> [Microcycle] {
        var mesocycleMicrocycles: [Microcycle] = []
        let microcycleIds = mesocycle.microcycleIds
        let microcycles = Microcycles().microcycles
        
        for microcycleId in microcycleIds {
            if let microcycle = microcycles[microcycleId] {
                mesocycleMicrocycles.append(microcycle)
            }
        }
        
        return mesocycleMicrocycles
    }
}
