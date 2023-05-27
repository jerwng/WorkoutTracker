//
//  Header.swift
//  Workout Tracker
//
//  Created by Jerry  on 2023-04-04.
//

import Foundation
import SwiftUI

struct HeaderView: View {
    var header: String
    var subHeader: String

    var body: some View {
        VStack{
            Text(header).font(.title).fontWeight(.bold)
            Text(subHeader).font(.headline).fontWeight(.bold)
        }
  
    }
}
