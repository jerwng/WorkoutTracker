//
//  MicrocycleView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-30.
//

import Foundation
import SwiftUI

struct MicrocycleView: View {
    /**
    Accepts microcycleId instead of microcycle since Microcycle type is not Codable
    for router
     */
    var microcycleId: Microcycle.ID

    var body: some View {
        Text("Microcycle")
        Text(String(microcycleId))
    }
}
