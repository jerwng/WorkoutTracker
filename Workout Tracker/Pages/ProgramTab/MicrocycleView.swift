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
    
    @State private var microcycle: Microcycle?
    
    func handleFetchMicrocycle() {
        if microcycle?.id == microcycleId {
            return
        }

        microcycle = MicrocycleUtils.getMicrocycleById(microcycleId: microcycleId)
    }

    var body: some View {
        VStack {
            HeaderView(header: "MICROCYCLE", subHeader: microcycle?.microcycleName ?? "").padding(.bottom, 40)
        
            Text("Content")
        }.onAppear() {
            handleFetchMicrocycle()
        } .microcycleViewBackgroundStylingModifier()
    }
}

// Extend View to provide a convenient modifier function
extension View {
    func microcycleViewBackgroundStylingModifier() -> some View {
        modifier(BackgroundStylingModifier())
    }
}
