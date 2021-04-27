//
//  ContentView.swift
//  UIpractice
//
//  Created by Frederico Kuckelhaus on 26.04.21.
//

import SwiftUI

struct ContentView: View {
    @State private var workoutIndex = 2
    let workouts = ["Bike", "Row", "Jog"]
    var body: some View {

        VStack {
            ScrollView {
                SummaryView()
                ActivityView()
            }
            Form {
                Section(header: Text("Whats your workout today?")) {
                    Picker("Whats your workout today?", selection: $workoutIndex) {
                        ForEach(0..<workouts.count){
                            Text("\(workouts[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

