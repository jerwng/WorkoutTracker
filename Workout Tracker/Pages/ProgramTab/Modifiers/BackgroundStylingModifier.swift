//
//  BackgroundPadding.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-31.
//

import Foundation
import SwiftUI

struct BackgroundStylingModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .top
            )
            .padding(.horizontal, UIScreen.main.bounds.width * 0.1)
            .padding(.top, 20)
            .background(Color("Background").ignoresSafeArea())
    }
}
