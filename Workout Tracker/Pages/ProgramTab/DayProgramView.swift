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
    
    func addExerciseButtonAction() {
        print("click add exercise")
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
            
            HStack {
                RoundPillButton(label: "Add Exercise", buttonAction: addExerciseButtonAction)
                Spacer()
            }.padding(.bottom, 10)
            
            if let dayExerciseSetIds = day?.exerciseSetIds {
                ExerciseList(exerciseSetIds: dayExerciseSetIds)
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
