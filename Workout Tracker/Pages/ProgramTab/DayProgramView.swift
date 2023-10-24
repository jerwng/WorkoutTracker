//
//  DayView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-09-06.
//

import Foundation
import SwiftUI
import CoreData

struct DayProgramView: View {
    var microcycleName: String
    
    @State private var isSheetOpen: Bool = false
    
    @EnvironmentObject var programRouter: ProgramRouter
    
    @ObservedObject private var viewModel: DayProgramViewModel
    
    init(context: NSManagedObjectContext, dayId: Day.ID, microcycleName: String) {
        viewModel = DayProgramViewModel(context: context, dayId: dayId)
        self.microcycleName = microcycleName
    }
    
    func addExerciseButtonAction() {
        isSheetOpen = true

    }
    
    func handleTapBackChevron() {
        programRouter.navigateBack()
    }

    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Image(systemName: "chevron.left")
                    .padding(.top, 9)
                    .onTapGesture {
                        handleTapBackChevron()
                    }
                Spacer()
                HeaderView(header: microcycleName, subHeader: viewModel.day?.dayName ?? "").padding(.bottom, 40)
                Spacer()
            }
            
            HStack {
                RoundPillButton(label: "Add Exercise", buttonAction: addExerciseButtonAction)
                Spacer()
            }.padding(.bottom, 10)
            
            if let day = viewModel.day {
                ExerciseList(exercises: day.dayExercises)
            }
        }
        .sheet(isPresented: $isSheetOpen) {
            CreateExerciseInputSheet(
                isSheetOpen: $isSheetOpen,
                selectedExercise: nil
            )
        }
        .microcycleViewBackgroundStylingModifier()
        .navigationBarBackButtonHidden()
    }
}

extension View {
    func dayProgramViewBackgroundStylingModifier() -> some View {
        modifier(BackgroundStylingModifier())
    }
}
