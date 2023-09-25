//
//  MicrocycleListRow.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-25.
//

import Foundation
import SwiftUI

struct MicrocycleListRow: View {
    var microcycle: Microcycle_MockData
    
    @EnvironmentObject var programRouter: ProgramRouter
    
    func handleTapRow() {
        programRouter.navigateTo(to: .microcycle(microcycleId: microcycle.id))
    }

    var body: some View {
        VStack {
            ListRow(title: microcycle.microcycleName, description: String(microcycle.dayIds.count) + " Days").padding(.bottom, 1)
                .onTapGesture {
                    handleTapRow()
                }
        }
    }
}
