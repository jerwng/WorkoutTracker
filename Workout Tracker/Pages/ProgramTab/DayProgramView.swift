//
//  DayView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-06.
//

import Foundation
import SwiftUI

struct DayProgramView: View {
    var microcycleName: String
    var dayId: Day.ID
    
    @State private var day: Day?
    
    func handleFetchDay() {
        if (day?.id == dayId) {
            return
        }
        
        day = DayUtils.getDayById(dayId: dayId)
    }

    var body: some View {
        VStack {
            Text(microcycleName)
            Text(String(dayId))
        }.onAppear() {
            handleFetchDay()
        }
        .microcycleViewBackgroundStylingModifier()
    }
}

extension View {
    func dayProgramViewBackgroundStylingModifier() -> some View {
        modifier(BackgroundStylingModifier())
    }
}
