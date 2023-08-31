//
//  ProgramRoot.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-30.
//

import Foundation
import SwiftUI

struct ProgramRoot: View {
    @ObservedObject var programRouter = ProgramRouter()
    
    var body: some View {
        NavigationStack(path: $programRouter.navPath) {
            MesocycleView()
            .navigationDestination(for: ProgramRouter.Destination.self) {
            destination in
            switch destination {
                case .microcycle(let microcycleId):
                    MicrocycleView(microcycleId: microcycleId)
                case .day:
                    Text("Day")
                default:
                    MesocycleView()
                }
            }
        }.environmentObject(programRouter)
    }
}
