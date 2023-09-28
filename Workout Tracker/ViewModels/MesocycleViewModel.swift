//
//  MesocycleViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-23.
//

import Foundation

extension MesocycleView {
    
    @MainActor class MesocycleViewModel: ObservableObject {
        // Initialize the active Mesocycle
        @Published var activeMesocycle: Mesocycle_MockData?
        
        private let mesocycles = Mesocycles().mesocycle
        
        init() {
            initMesocycle()
        }
        
        /**
        Find the first not completed mesocycle and set it as the activeMesosycle
         */
        func initMesocycle() {
            for mesocycle in mesocycles {
                if (!mesocycle.value.isComplete) {
                    activeMesocycle = mesocycle.value
                    break
                   
                }
            }
        }
    }
}
