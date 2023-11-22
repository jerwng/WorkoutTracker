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
        viewModel.createMicrocycleToActiveMesocycle()
    }
    
    func completeButtonAction() {
        print("click complete")
        viewModel.setActiveMesocycleComplete()
    }
    
    // Deleting Microcycle requires a refetch of the Active Mesocycle
    // If not, deleting a second microcycle after exiting and re-entering MesocycleView
    // Will result in a NSInternalInconsistencyException. 
    // Not sure exact cause, deleting other entities does not result in the same error.
    func handleMicrocycleDelete() {
        viewModel.fetchActiveMesocycle()
    }
    
    var body: some View {
        VStack {
            HeaderView(header: "MESOCYCLE", subHeader: viewModel.activeMesocycle?.mesocycleName ?? "").padding(.bottom, 40)
            
            HStack {
                RoundPillButton(label: "Add Week", buttonAction: addWeekButtonAction)
                Spacer()
                RoundPillButton(label: "Complete", buttonAction: completeButtonAction)
            }.padding(.bottom, 10)
            
            if let activeMesocycle = viewModel.activeMesocycle {
                MicrocycleList(microcycles: activeMesocycle.mesocycleMicrocycles, onMicrocycleDelete: handleMicrocycleDelete)
            }
            
        }.mesocycleViewBackgroundStylingModifier()	
    }
}

extension View {
    func mesocycleViewBackgroundStylingModifier() -> some View {
        modifier(BackgroundStylingModifier())
    }
}
