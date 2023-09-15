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
    
    private let initialWeight: String
    private let initialReps: String
    private let initialTime: String
    private let initialNotes: String
    private let name: String
    
    init(isSheetOpen: Binding<Bool>, selectedExercise: Exercise, selectedExerciseEntry: ExerciseEntry?) {

        _isSheetOpen = isSheetOpen
        self.name = selectedExercise.name
        self.initialNotes = selectedExercise.notes ?? ""

        if let a = selectedExerciseEntry {
            self.initialWeight = String(a.weight)
            self.initialReps = String(a.reps)
            self.initialTime = a.time ?? ""
        } else {
            self.initialWeight = ""
            self.initialReps = ""
            self.initialTime = ""
        }
    }
    
    func handleButtonTap() {
        print("tap delete exercise entry button")
    }
    
    var body: some View {
        VStack {
            ExerciseEntryInputSheetBody(
                isSheetOpen: $isSheetOpen,
                name: name,
                weight: initialWeight,
                reps: initialReps,
                time: initialTime,
                notes: initialNotes
            )
            
            Button("Delete Entry", action: handleButtonTap).foregroundColor(.red).padding(.bottom, 5.0)
        }
    }
    
}
