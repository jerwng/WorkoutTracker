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
     
     TODO: Create MicrocycleViewModel
     */
    var microcycleId: Microcycle.ID
    
    @State private var microcycle: Microcycle_MockData?
    
    @EnvironmentObject var programRouter: ProgramRouter
    
    func handleFetchMicrocycle() {
//        if microcycle?.id == microcycleId {
//            return
//        }
//
//        microcycle = MicrocycleUtils.getMicrocycleById(microcycleId: microcycleId)
    }
    
    func addDayButtonAction() {
        print("click add day")
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
                HeaderView(header: "MICROCYCLE", subHeader: microcycle?.microcycleName ?? "").padding(.bottom, 40)
                Spacer()
            }
            
            HStack {
                RoundPillButton(label: "Add Day", buttonAction: addDayButtonAction)
                Spacer()
            }.padding(.bottom, 10)
       
            if let microcycleName = microcycle?.microcycleName, let microcycleDayIds = microcycle?.dayIds {
                DayList(microcycleName: microcycleName, dayIds: microcycleDayIds)
            }
        }.onAppear() {
            handleFetchMicrocycle()
        }
        .microcycleViewBackgroundStylingModifier()
        .navigationBarBackButtonHidden()
    }
}

// Extend View to provide a convenient modifier function
extension View {
    func microcycleViewBackgroundStylingModifier() -> some View {
        modifier(BackgroundStylingModifier())
    }
}
