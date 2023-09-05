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

    var body: some View {
        Text(day.dayName)
    }
}
