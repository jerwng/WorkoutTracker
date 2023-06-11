//
//  BaseExerciseInputSheetBody.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-06-11.
//

import Foundation
import SwiftUI

struct BaseExerciseInputSheetBody<Content: View>: View {
    var content: Content
    var presentationDetents: Set<PresentationDetent> = [.fraction(0.85)]
    var sheetTitle: String
    
    var body: some View {
        VStack {
            HStack {
                Text(sheetTitle).fontWeight(.bold)
            }
            .padding(.vertical, 10.0)

            content
        }.frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top
          )
        .presentationDetents(presentationDetents)
    }
}
