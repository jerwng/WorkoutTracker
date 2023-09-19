//
//  ContentView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-04.
//

import SwiftUI

struct ContentView: View {
    // Make fetch request with no sorting to fetch property
    @FetchRequest(sortDescriptors: []) var exercises: FetchedResults<ExerciseTest>
    
    // moc: Managed object context provided by Core Data, responsible for loading and saving data
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        VStack {
            List(exercises) {exercise in
                Text(exercise.name ?? "")
            }
            
            Button("Add") {
                let firstNames = ["A", "B", "C", "D", "E"]
                let lastNames = ["1", "2", "3", "4", "5"]
                
                let chosenFirstName = firstNames.randomElement()!
                let chosenLastName = lastNames.randomElement()!
                
                let exercise = ExerciseTest(context: moc)
                exercise.id = UUID()
                exercise.name = "\(chosenFirstName) \(chosenLastName)"
                
                try? moc.save() // add except to handle potential errors
            }
        }
//        TabView {
//            DayView(day: 3, week: 1).tabItem {
//                Image(systemName: "calendar")
//                Text("Today")
//            }
//
//            ProgramRoot().tabItem {
//                Image(systemName: "list.bullet")
//                Text("Program")
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
