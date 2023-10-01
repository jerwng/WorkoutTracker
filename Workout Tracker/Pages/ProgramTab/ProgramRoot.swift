//
//  ProgramRoot.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-30.
//

import Foundation
import SwiftUI

struct ProgramRoot: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var programRouter = ProgramRouter()
    
    var body: some View {
        NavigationStack(path: $programRouter.navPath) {
            MesocycleView(context: moc)
            .navigationDestination(for: ProgramRouter.Destination.self) {
            destination in
            switch destination {
                case .microcycle(let microcycleId):
                    MicrocycleView(microcycleId: microcycleId)
                case .day(let microcycleName, let dayId):
                    DayProgramView(microcycleName: microcycleName, dayId: dayId)
                default:
                MesocycleView(context: moc)
                }
            }
        }.environmentObject(programRouter)
    }
}
