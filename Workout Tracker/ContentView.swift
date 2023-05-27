//
//  ContentView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        DayView(day: 3, week: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
