//
//  Cycle.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-05-28.
//

import Foundation

struct CycleUtils {
    static func test() {
        print("hello3")
    }
    
    static func test2(value: String) {
        print("hello value " + value)
    }
    
    static func getNextDay(
        curMicrocycleId: Microcycle.ID,
        curDayId: Day.ID,
        microcycles: [Int: Microcycle],
        days: [Int: Day]
    ) {
        print("getNextDay - Get Next Day placeholder")
    }
}


