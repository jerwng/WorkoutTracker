//
//  MicrocycleList.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-25.
//

import Foundation
import SwiftUI

struct DayList: View {
    var microcycleName: String
    var dayIds: [Day.ID]
    
    var body: some View {
        VStack {
            ForEach(dayIds, id: \.self) {
                dayId in
                    if let day = DayUtils.getDayById(dayId: dayId) {
                        DayListRow(microcycleName: microcycleName, day: day)
                }
            }
        }
    }
}
