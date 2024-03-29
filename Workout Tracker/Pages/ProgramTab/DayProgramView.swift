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
    private let context: NSManagedObjectContext
    
    @State private var isSheetOpen: Bool = false
    
    @EnvironmentObject var programRouter: ProgramRouter
    
    @ObservedObject private var viewModel: DayProgramViewModel
    
    init(context: NSManagedObjectContext, dayId: Day.ID, microcycleName: String) {
        viewModel = DayProgramViewModel(context: context, dayId: dayId)
        self.microcycleName = microcycleName
        self.context = context
    }
    
    func addExerciseButtonAction() {
        isSheetOpen = true

    }
    
    func handleTapBackChevron() {
        programRouter.navigateBack()
    }
    
    func handleRefreshDay() {
        viewModel.refreshDay()
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
                ExerciseList(
                    context: context,
                    exercises: day.dayExercises,
                    day: day,
                    onExerciseUpdate: handleRefreshDay
                )
            }
        }
        .sheet(isPresented: $isSheetOpen) {
            if let _day = viewModel.day {
                CreateExerciseInputSheet(
                    context: context,
                    isSheetOpen: $isSheetOpen,
                    selectedExercise: nil,
                    day: _day,
                    onExerciseCreate: handleRefreshDay
                )
            }
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
