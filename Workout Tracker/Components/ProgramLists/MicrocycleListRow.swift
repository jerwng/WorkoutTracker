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
        VStack {
            HStack {
                Text(microcycle.microcycleName).font(.system(size: 28, weight: .bold))
                Spacer()
                Text(String(microcycle.dayIds.count) + " Days")
            }.padding(.bottom, 1)
        }
    }
}
