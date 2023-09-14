//
//  MicrocycleList.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-25.
//

import Foundation
import SwiftUI

struct MicrocycleList: View {
    var microcycleIds: [Microcycle.ID]
    
    func handleDelete(at offsets: IndexSet) {
        print("delete microcycle")
    }
    
    var body: some View {
        List {
            ForEach(microcycleIds, id: \.self) {
                microcycleId in
                    if let microcycle = MicrocycleUtils.getMicrocycleById(microcycleId: microcycleId) {
                        MicrocycleListRow(microcycle: microcycle)
                            .microcycleListListRowStylingModifier()
                    }
            }.onDelete(perform: handleDelete)
        }.listStyle(.plain)
    }
}

extension View {
    func microcycleListListRowStylingModifier() -> some View {
        modifier(ListRowStylingModifier())
    }
}
