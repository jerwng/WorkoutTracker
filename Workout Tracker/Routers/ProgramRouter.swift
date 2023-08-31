//
//  Router.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-30.
//

import Foundation
import SwiftUI

/**
 SwiftUI Routing tutorial from: https://blorenzop.medium.com/routing-navigation-in-swiftui-f1f8ff818937
 */

final class ProgramRouter: ObservableObject {
    public enum Destination: Codable, Hashable {
        case mesocycle
        case microcycle(microcycleId: Microcycle.ID)
        case day
    }
    
    @Published var navPath = NavigationPath()
    
    func navigateTo(to destination: Destination) {
        navPath.append(destination)
    }
    
    func navigateBack() {
        navPath.removeLast()
    }
    
    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
