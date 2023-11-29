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

                Image(systemName: "chevron.left")
                    .padding(.top, 8)
                    .onTapGesture {
                        viewModel.handleTapPreviousDay()
                    }
                    .opacity(viewModel.previousDay != nil ? 1 : 0)
                
                
                if let selectedDay = viewModel.selectedDay {
                    HeaderView(header: selectedDay.dayName, subHeader: selectedDay.dayMicrocycleName)
                }
                
                Image(systemName: "chevron.right")
                    .padding(.top, 8)
                    .onTapGesture {
                        viewModel.handleTapNextDay()
                    }
                    .opacity(viewModel.nextDay != nil ? 1 : 0)
                
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
