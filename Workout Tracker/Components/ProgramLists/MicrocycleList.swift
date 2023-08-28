//
//  MicrocycleList.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-25.
//

import Foundation
import SwiftUI

struct MicrocycleList: View {
    var microcycles: [Microcycle]
    
    var body: some View {
        VStack {
            ForEach(microcycles) {
                microcycle in Text(microcycle.microcycleName)
            }
        }
    }
}
