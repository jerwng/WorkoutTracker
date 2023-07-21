//
//  TextField.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-07-20.
//

import Foundation
import SwiftUI

struct BackgroundTextField: View {
    @Binding var textValue: String
    var textPlaceholder: String
    
    var body: some View {
        TextField(text: $textValue, prompt: Text(textPlaceholder), axis: .vertical) {
        
        }.listRowBackground(Color("Background"))
    }
}
