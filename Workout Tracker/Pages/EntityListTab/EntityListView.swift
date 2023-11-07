//
//  EntityListView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-11-07.
//

import Foundation
import SwiftUI
import CoreData

struct EntityListView: View {
    @ObservedObject private var viewModel: EntityListViewModel
    
    init(context: NSManagedObjectContext) {
        viewModel = EntityListViewModel(context: context)
    }
    
    func handleDeleteMesocycle(at offsets: IndexSet) {
        viewModel.handleDeleteMesocycle(index: offsets.first!)
    }
    
    func handleDeleteMicrocycle(at offsets: IndexSet) {
        viewModel.handleDeleteMicrocycle(index: offsets.first!)
    }
    
    func handleDeleteDay(at offsets: IndexSet) {
        viewModel.handleDeleteDay(index: offsets.first!)
    }
    
    func handleDeleteExercise(at offsets: IndexSet) {
        viewModel.handleDeleteExercise(index: offsets.first!)
    }

    var body: some View {
        VStack {
            List {
                Section(header: Text("Mesocycles")) {
                    ForEach(viewModel.mesocycles, id: \.self) { mesocycle in
                        Text(mesocycle.mesocycleName)
                    }.onDelete(perform: handleDeleteMesocycle)
                }.headerProminence(.increased)
                
                Section(header: Text("Microcycles")) {
                    ForEach(viewModel.microcycles, id: \.self) { microcycle in
                        Text(microcycle.microcycleName)
                    }.onDelete(perform: handleDeleteMicrocycle)
                }.headerProminence(.increased)
                
                Section(header: Text("Days")) {
                    ForEach(viewModel.days, id: \.self) { day in
                        Text(day.dayName)
                    }.onDelete(perform: handleDeleteDay)
                }.headerProminence(.increased)
                
                Section(header: Text("Exercises")) {
                    ForEach(viewModel.exercises, id: \.self) { exercise in
                        Text(exercise.exerciseName)
                    }.onDelete(perform: handleDeleteExercise)
                }.headerProminence(.increased)
            }
        }.onAppear {
            viewModel.initializeEntities()
        }
    }
}
