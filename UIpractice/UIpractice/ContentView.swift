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
            TabView {
                ActivityView()
                ActivityView()
                ActivityView()
            }.tabViewStyle(PageTabViewStyle()).padding(.horizontal)



        }.background(Color.black).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
