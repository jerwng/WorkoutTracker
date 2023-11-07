//
//  ContentView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-04.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        TabView {
            DayView(day: 3, week: 1).tabItem {
                Image(systemName: "calendar")
                Text("Today")
            }

            ProgramRoot().tabItem {
                Image(systemName: "list.bullet")
                Text("Program")
            }
            
            if (FeatureFlags.entitiesTab) {
                EntityListView(context: context).tabItem {
                    Image(systemName: "rectangle.and.text.magnifyingglass")
                    Text("Entities")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
