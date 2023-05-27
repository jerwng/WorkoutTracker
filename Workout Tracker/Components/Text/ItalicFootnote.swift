//
//  ItalicFootnote.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-12.
//

import Foundation
import SwiftUI

struct ItalicFootnote: View {
    var content: String
    
    var body: some View {
        Text(content)
            .font(.footnote).italic()
    }
}
