//
//  ContentView.swift
//  UnitConverter
//
//  Created by Frederico Kuckelhaus on 15.04.21.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = false
    @State private var temperatureUnit = 0
    @State private var temperatureUnitTo = 1
    @State private var temperatureTextField = ""
    
    let temperatureUnits = ["Celsius", "Fahrenheit", "Kelvin"]
    var conversionValue: Double {
        let selectedTemperatureUnit = temperatureUnits[temperatureUnit]
        let userTemperature = Double(temperatureTextField) ?? 0
        var initialConversion: Double
        var finalConversion: Double
        let selectedConvertIntoUnit = temperatureUnits[temperatureUnitTo]
        
        switch selectedTemperatureUnit {
        case "Celsius":
            initialConversion = userTemperature + 273.15
        case "Fahrenheit":
            initialConversion = (userTemperature - 32) * 5/9 + 273.15
        default:
            initialConversion = userTemperature
        }
        //
        switch selectedConvertIntoUnit {
        case "Celsius":
            finalConversion = initialConversion - 273.15
        case "Fahrenheit":
            finalConversion = (initialConversion - 273.15) * 9/5 + 32
        default:
            finalConversion = initialConversion
        }
        return finalConversion
    }
    
    var body: some View {
        VStack(alignment: .center) {
            HStack {
                Text("")
                Toggle(isOn: $isNight) {
                }.padding()
            }
            Text("iConvert")
            Section {
                Picker("From Unit", selection: $temperatureUnit) {
                    ForEach(0..<temperatureUnits.count) {
                        Text("\(temperatureUnits[$0])")
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
            HStack {
                Spacer()
                TextField("Enter the temperature", text: $temperatureTextField).keyboardType(.decimalPad)
                Spacer()
            }
            
            Section {
                Picker("From Unit", selection: $temperatureUnitTo) {
                    ForEach(0..<temperatureUnits.count) {
                        Text("\(temperatureUnits[$0])")
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }
            
            Text("It is \(conversionValue, specifier: "%.2f")")
            
            
            Spacer()
            Link("My GitHub", destination: URL(string: "https://github.com/Fredposk")!)
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
