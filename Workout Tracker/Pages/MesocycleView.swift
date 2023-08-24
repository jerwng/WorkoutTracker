//
//  MesocycleView.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-08-22.
//

import Foundation
import SwiftUI

struct MesocycleView: View {
    
    // Add @ObservedModel for Mesocycle Model here
    @ObservedObject var viewModel: MesocycleViewModel = MesocycleViewModel()
    
    var body: some View {
        VStack {
            HeaderView(header: "MESOCYCLE", subHeader: "")
            
        } .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .top
        ).background(Color("Background").ignoresSafeArea())
    }
}
