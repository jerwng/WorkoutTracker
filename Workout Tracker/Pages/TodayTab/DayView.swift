//
//  DayView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-12.
//

import Foundation
import SwiftUI
import CoreData

struct DayView: View {
    @ObservedObject private var viewModel: DayViewModel

    init(context: NSManagedObjectContext) {
        viewModel = DayViewModel(context: context)
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                
                if let previousDay = viewModel.previousDay {
                    Image(systemName: "chevron.left").padding(.top, 8).onTapGesture {
                        viewModel.handleTapPreviousDay()
                    }
                }
                
                if let selectedDay = viewModel.selectedDay {
                    HeaderView(header: selectedDay.dayMicrocycleName, subHeader: selectedDay.dayName)
                }
                
                if let nextDay = viewModel.nextDay {
                    Image(systemName: "chevron.right").padding(.top, 8).onTapGesture {
                        viewModel.handleTapNextDay()
                    }
                }
            }
   
            ExerciseListView()

        } .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top
        ).background(Color("Background").ignoresSafeArea()
        ).onAppear{
            viewModel.initializeSelectedDay()
        }
    }
}
