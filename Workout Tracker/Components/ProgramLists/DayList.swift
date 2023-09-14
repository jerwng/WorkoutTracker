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
    
    func handleDelete(at offsets: IndexSet) {
        print("delete day")
    }
    
    var body: some View {
        List {
            ForEach(dayIds, id: \.self) {
                dayId in
                    if let day = DayUtils.getDayById(dayId: dayId) {
                        DayListRow(microcycleName: microcycleName, day: day)
                            .dayListListRowStylingModifier()
                }
            }.onDelete(perform: handleDelete)
        }.listStyle(.plain)
    }
}

extension View {
    func dayListListRowStylingModifier() -> some View {
        modifier(ListRowStylingModifier())
    }
}
