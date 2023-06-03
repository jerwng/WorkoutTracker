//
//  ExerciseNotes.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-06-03.
//

import Foundation
import SwiftUI

struct ExerciseNotes: View {
    var exerciseNotes: String
    
    var body: some View {
        VStack(alignment: .leading) {
            ItalicFootnote(content: "Exercise Notes:")
            ItalicFootnote(content: exerciseNotes)
        }
    }
    
}
