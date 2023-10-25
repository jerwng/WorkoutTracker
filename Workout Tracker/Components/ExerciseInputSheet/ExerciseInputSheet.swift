//
//  ExerciseInputSheet.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-03.
//

import Foundation
import SwiftUI

struct ExerciseInputSheet: View {
    @Binding var isSheetOpen: Bool
    
    @State private var weight: String
    @State private var reps: String
    @State private var time: String
    @State private var notes: String
    @State private var name: String
    
    init(isSheetOpen: Binding<Bool>, selectedExercise: Exercise_MockData, selectedExerciseEntry: ExerciseEntry_MockData?) {

        _isSheetOpen = isSheetOpen
        self.name = selectedExercise.name
        self.notes = selectedExercise.notes ?? ""

        if let a = selectedExerciseEntry {
            self.weight = String(a.weight)
            self.reps = String(a.reps)
            self.time = a.time ?? ""
        } else {
            self.weight = ""
            self.reps = ""
            self.time = ""
        }
    }
    
    func handleButtonTap() {
        print("tap delete exercise entry button")
    }
    
    var body: some View {
        VStack {
            ExerciseEntryInputSheetBody(
                isSheetOpen: $isSheetOpen,
                name: $name,
                weight: $weight,
                reps: $reps,
                time: $time,
                notes: $notes
            )
            
            Button("Delete Entry", action: handleButtonTap).foregroundColor(.red).padding(.bottom, 5.0)
        }
    }
    
}
