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
    
    func handleDeleteMesocycle(at offsets: IndexSet) {
        let mesocycleToBeDeleted = viewModel.mesocycles[offsets.first!]
        mesocycleToBeDeleted.delete()
        viewModel.fetchAllMesocycles()
    }
    
    func handleDeleteMicrocycle(at offsets: IndexSet) {
        let activeMesocycleMicrocycles = viewModel.getActiveMesocycleMicrocycles()
        let microcycleToBeDeleted = activeMesocycleMicrocycles[offsets.first!]
        
        microcycleToBeDeleted.delete()
        viewModel.fetchActiveMesocycle()
    }
    
    var body: some View {
        // Mesocycle Dashboard, which helps visualize mesocycle values
        if (FeatureFlags.mesocycleDashboard) {
            VStack {
                List {
                    ForEach(viewModel.mesocycles, id: \.self) { mesocycle in
                        Text(mesocycle.mesocycleName)
                    }.onDelete(perform: handleDeleteMesocycle)
                }

                Button("Add Mesocycle") {
                    viewModel.createMesocycle()
                    viewModel.fetchAllMesocycles()
                }
            }.onAppear(){
                viewModel.fetchAllMesocycles()
            }
            
        } else if (FeatureFlags.microcycleDashboard) {
            VStack {
                List {
                    ForEach(viewModel.getActiveMesocycleMicrocycles(), id: \.self) { microcycle in
                        Text(microcycle.microcycleName)
                    }.onDelete(perform: handleDeleteMicrocycle)
                }

                Button("Add Microcycle") {
                    viewModel.createMicrocycleToActiveMesocycle()
                    viewModel.fetchActiveMesocycle()
                }
            }.onAppear(){
                viewModel.fetchActiveMesocycle()
            }
            
        } else {
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
                viewModel.fetchActiveMesocycle()
            }
        }
    }
}

extension View {
    func mesocycleViewBackgroundStylingModifier() -> some View {
        modifier(BackgroundStylingModifier())
    }
}
