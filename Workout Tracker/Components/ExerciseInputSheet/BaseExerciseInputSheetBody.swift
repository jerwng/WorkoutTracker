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

    @Binding var isSheetOpen: Bool

    var handleSubmit: (() -> Void)?
    
    func handleCancelButtonTap() {
        print("tap cancel")
        isSheetOpen = false
    }
    
    func handleDoneButtonTap() {
        print("tap done")
        isSheetOpen = false
        
        if let _handleSubmit = handleSubmit {
            _handleSubmit()
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                Button {
                    handleCancelButtonTap()
                } label: {
                    Text("Cancel")
                // Add same frame width to Cancel/Done buttons to ensure title is aligned in the center
                }.frame(width: 55.0, alignment: .leading)
                
                Spacer()
                
                Text(sheetTitle).fontWeight(.bold)
                
                Spacer()
                
                Button {
                    handleDoneButtonTap()
                } label: {
                    Text("Done")
                }.frame(width: 55.0, alignment: .trailing)
            }
            .padding(.vertical, 10.0)
            .padding(.horizontal, 15.0)

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
