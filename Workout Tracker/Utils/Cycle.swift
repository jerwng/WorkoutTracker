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
        curMicrocycleId: Microcycle_MockData.ID,
        curDayId: Day_MockData.ID,
        microcycles: [Int: Microcycle_MockData],
        days: [Int: Day_MockData]
    ) {
        print("getNextDay - Get Next Day placeholder")
    }
}


