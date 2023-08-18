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
    @State private var textValue: String
    private let textPlaceholder: String
    
    init(initialValue: String?, textPlaceholder: String?) {
        _textValue = State(initialValue: initialValue ?? "")
        self.textPlaceholder = textPlaceholder ?? ""
    }
    
    var body: some View {
        LabeledContent {
            TextField(text: $textValue, axis: .vertical) {}.multilineTextAlignment(.trailing)
        } label : {
            Text(textPlaceholder).foregroundColor(Color("BackgroundTextField - Label"))
        }.listRowBackground(Color("Background"))
    }
}

/**
 A text field that only allows numbers and ".".
 Shows decimal pad keyboard.
 */
struct DecimalPadTextField: View {
    @State private var textValue: String
    private let textPlaceholder: String
    
    init(initialValue: String?, textPlaceholder: String?) {
        _textValue = State(initialValue: initialValue ?? "")
        self.textPlaceholder = textPlaceholder ?? ""
    }
    
    var body: some View {
        BackgroundTextField(
            initialValue: textValue, textPlaceholder: textPlaceholder
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
