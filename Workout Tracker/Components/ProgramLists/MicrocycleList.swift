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
    
    var body: some View {
        VStack {
            ForEach(microcycleIds, id: \.self) {
                microcycleId in
                    if let microcycle = MicrocycleUtils.getMicrocycleById(microcycleId: microcycleId) {
                        MicrocycleListRow(microcycle: microcycle)
                    }
            }
        }
    }
}
