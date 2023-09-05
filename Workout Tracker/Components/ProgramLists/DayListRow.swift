//
//  DayListRow.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-05.
//

import Foundation
import SwiftUI

struct DayListRow: View {
    var day: Day
    
    func handleTapRow() {
        print("tap day list row")
    }

    var body: some View {
        VStack {
            ListRow(
                title: day.dayName,
                description: String(day.exerciseSetIds.count) + " Exercises"
            ).padding(.bottom, 1)
        }.onTapGesture {
            handleTapRow()
        }
    }
}
