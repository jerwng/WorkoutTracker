//
//  ListRowStylingModifier.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-14.
//

import Foundation
import SwiftUI

struct ListRowStylingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .listRowBackground(Color("Background"))
            .listRowSeparator(.hidden)
            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
    }
}
