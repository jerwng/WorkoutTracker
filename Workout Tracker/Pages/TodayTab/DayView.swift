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
                if let selectedDay = viewModel.selectedDay {
                    Image(systemName: "chevron.left").padding(.top, 8)
                    HeaderView(header: selectedDay.dayMicrocycleName, subHeader: selectedDay.dayName)
                    Image(systemName: "chevron.right").padding(.top, 8)
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
            viewModel.setSelectedDay()
        }
    }
}
