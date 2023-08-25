//
//  RoundPillButton.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-24.
//

import Foundation
import SwiftUI

struct RoundPillButton: View {
    var label: String
    var buttonAction: () -> Void

    var body: some View {
        Button(action: buttonAction) {
            Text(label)
        }
    }
}
