//
//  ContentView.swift
//  UIpractice
//
//  Created by Frederico Kuckelhaus on 26.04.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        ScrollView {
            SummaryView()
            ActivityView()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

