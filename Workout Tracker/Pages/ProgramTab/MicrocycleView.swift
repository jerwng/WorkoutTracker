//
//  MicrocycleView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-30.
//

import Foundation
import SwiftUI
import CoreData

struct MicrocycleView: View {
    @ObservedObject private var viewModel: MicrocycleViewModel
    @EnvironmentObject var programRouter: ProgramRouter
    
    init(context: NSManagedObjectContext, microcycleId: Microcycle.ID) {
        viewModel = MicrocycleViewModel(context: context, microcycleId: microcycleId)
    }
    
    func addDayButtonAction() {
        print("click add day")
        viewModel.createDayToSelectedMicrocycle()
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
                HeaderView(header: "MICROCYCLE", subHeader: viewModel.microcycle?.microcycleName ?? "").padding(.bottom, 40)
                Spacer()
            }
            
            HStack {
                RoundPillButton(label: "Add Day", buttonAction: addDayButtonAction)
                Spacer()
            }.padding(.bottom, 10)
       
            if let microcycle = viewModel.microcycle {
                DayList(microcycleName: microcycle.microcycleName, days: microcycle.microcycleDays)
            }
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
