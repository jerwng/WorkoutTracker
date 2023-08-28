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

    var body: some View {
        Text(microcycle.microcycleName)
        Text(String(microcycle.dayIds.count) + " Days")
    }
}
