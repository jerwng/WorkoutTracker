//
//  RoundPillButton.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-24.
//

import Foundation
import SwiftUI

/**
 Custom buttonStyle for RoundPillButton
 */
struct RoundPillButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundStyle(.black)
        
            // Add RoundedRectangle with same corner radius as overlay to background color
            // is contained within the border
            .background(
                RoundedRectangle(cornerRadius: 40, style: .continuous).fill(configuration.isPressed ? Color("BackgroundSelected") : Color("Background"))
            )
            // Add RoundedRectangle overlay to display the round pill button border
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                .strokeBorder(.black, lineWidth: 1)
            )
    }
}

struct RoundPillButton: View {
    var label: String
    var buttonAction: () -> Void

    var body: some View {
        Button(action: buttonAction
        ) {
            Text(label)
                .fontWeight(.bold)
                .padding(.horizontal, 5.0)
                .padding(.vertical, 3.0)
        }
        .buttonStyle(RoundPillButtonStyle())
    }
}
