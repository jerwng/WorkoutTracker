//
//  MicrocycleList.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-25.
//

import Foundation
import SwiftUI

struct DayList: View {
    var dayIds: [Day.ID]
    
    var body: some View {
        VStack {
            ForEach(dayIds, id: \.self) {
                dayId in
                    Text("Hello")
            }
        }
    }
}
