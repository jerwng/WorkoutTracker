//
//  ListRow.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-05.
//

import Foundation
import SwiftUI

struct ListRow: View {
    var title: String // Left side of the row with bold text
    var description: String? // Right side of the row, normal text size
    
    var body: some View {
        HStack {
            Text(title).font(.title2).fontWeight(.bold)
            Spacer()
            if ((description) != nil) {
                Text(description!)
            }
        }
    }
}
