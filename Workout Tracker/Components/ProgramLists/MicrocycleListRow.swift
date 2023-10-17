//
//  MicrocycleListRow.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-25.
//

import Foundation
import SwiftUI

struct MicrocycleListRow: View {
    var microcycle: Microcycle
    
    @EnvironmentObject var programRouter: ProgramRouter
    
    func handleTapRow() {
        if let microcycleId = microcycle.id {
            programRouter.navigateTo(to: .microcycle(microcycleId: microcycleId))
        }
    }

    var body: some View {
        VStack {
            ListRow(title: microcycle.microcycleName, description: String(microcycle.micorcycleDays.count) + " Days").padding(.bottom, 1)
                .onTapGesture {
                    handleTapRow()
                }
        }
    }
}
