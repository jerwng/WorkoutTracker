//
//  Day.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-28.
//

import Foundation

struct DayUtils {
    static func test() {
        print("hello3")
    }
    
    static func getDayById(dayId: Day.ID) -> Day? {
        let days = Days().days
        
        return days[dayId]
    }
}
