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
    
    @EnvironmentObject var programRouter: ProgramRouter
    
    func handleFetchDay() {
        if (day?.id == dayId) {
            return
        }
        
        day = DayUtils.getDayById(dayId: dayId)
    }
    
    func handleTapBackChevron() {
        programRouter.navigateBack()
    }

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "chevron.left")
                    .padding(.top, 9)
                    .onTapGesture {
                        handleTapBackChevron()
                    }
                Spacer()
                HeaderView(header: microcycleName, subHeader: day?.dayName ?? "").padding(.bottom, 40)
                Spacer()
            }
        }.onAppear() {
            handleFetchDay()
        }
        .microcycleViewBackgroundStylingModifier()
        .navigationBarBackButtonHidden()
    }
}

extension View {
    func dayProgramViewBackgroundStylingModifier() -> some View {
        modifier(BackgroundStylingModifier())
    }
}
