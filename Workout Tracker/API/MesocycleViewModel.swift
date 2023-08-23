//
//  MesocycleViewModel.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-23.
//

import Foundation

class MesocycleViewModel: ObservableObject {
    
    // Initialize the active Mesocycle
    @Published var activeMesocycle: Mesocycle?
    
    @Published var test: String = "ASDF"
    
    func initMesocycle() {
        print("hello World")
    }
}
