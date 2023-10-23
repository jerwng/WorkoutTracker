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
    var days: [Day]
    
    func handleDelete(at offsets: IndexSet) {
        print("delete day")
        
        let dayToBeDeleted = days[offsets.first!]
        
        dayToBeDeleted.delete()
    }
    
    var body: some View {
        List {
            ForEach(days, id: \.self.id) {
                day in
                    DayListRow(microcycleName: microcycleName, day: day)
                    .dayListListRowStylingModifier()
            }.onDelete(perform: handleDelete)
        }.listStyle(.plain)
    }
}

extension View {
    func dayListListRowStylingModifier() -> some View {
        modifier(ListRowStylingModifier())
    }
}
