//
//  TextField.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-07-20.
//

import Foundation
import SwiftUI
import Combine

struct BackgroundTextField: View {
    @Binding var textValue: String
    var textPlaceholder: String
    
    var body: some View {
        TextField(text: $textValue, prompt: Text(textPlaceholder), axis: .vertical) {
        
        }.listRowBackground(Color("Background"))
    }
}

/**
 A text field that only allows numbers and ".".
 Shows decimal pad keyboard.
 */
struct DecimalPadTextField: View {
    @Binding var textValue: String
    var textPlaceholder: String
    
    var body: some View {
        BackgroundTextField(
            textValue: $textValue, textPlaceholder: textPlaceholder
        )
        .keyboardType(.decimalPad)
        /**
         Filter to only allow numbers and "." in the input
         See https://stackoverflow.com/a/58736068
         */
        .onReceive(Just(textValue)) { newValue in
            let filtered = newValue.filter { "0123456789.".contains($0) }
            // $0 is the first argument in the filter closure https://developer.apple.com/forums/thread/124678
            if filtered != newValue {
                self.textValue = filtered
            }
        }
    }
}
