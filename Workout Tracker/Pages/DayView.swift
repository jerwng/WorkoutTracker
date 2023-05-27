//
//  DayView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-12.
//

import Foundation
import SwiftUI

struct DayView: View {
    var day: Int
    var week: Int
    
    var body: some View {
        VStack {
            HeaderView(header: "WEEK " + String(week), subHeader: "DAY " + String(day))
            ExerciseListView()

        } .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top
        ).background(Color("Background").ignoresSafeArea())
    }
}
