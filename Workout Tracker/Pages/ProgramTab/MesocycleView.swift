//
//  MesocycleView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-22.
//

import Foundation
import SwiftUI
import CoreData

struct MesocycleView: View {
    // Add @ObservedModel for Mesocycle Model here
    @ObservedObject private var viewModel: MesocycleViewModel

    init(context: NSManagedObjectContext) {
        viewModel = MesocycleViewModel(context: context)
    }
    
    func addWeekButtonAction() {
        print("click add week")
    }
    
    func completeButtonAction() {
        print("click complete")
    }
    
    var body: some View {
        VStack {
            HeaderView(header: "MESOCYCLE", subHeader: "").padding(.bottom, 40)
            
            HStack {
                RoundPillButton(label: "Add Week", buttonAction: addWeekButtonAction)
                Spacer()
                RoundPillButton(label: "Complete", buttonAction: completeButtonAction)
            }.padding(.bottom, 10)
            
//            if let activeMesocycle = viewModel.activeMesocycle {
//                MicrocycleList(microcycles: activeMesocycle.mesocycleMicrocycles)
//            }
            
        }.mesocycleViewBackgroundStylingModifier().onAppear{
            viewModel.fetch()
        }
           
    }
}

extension View {
    func mesocycleViewBackgroundStylingModifier() -> some View {
        modifier(BackgroundStylingModifier())
    }
}
