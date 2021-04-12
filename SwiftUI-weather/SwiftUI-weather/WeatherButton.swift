//
//  WeatherButton.swift
//  SwiftUI-weather
//
//  Created by Frederico Kuckelhaus on 11.04.21.
//


import SwiftUI


struct WeatherButton: View {
    @Binding var isNight: Bool
    var text: String
    var colorBtn: Color
    var body: some View {
        Button {
            print("button tapped")
            isNight.toggle()
        } label: {
            Text(text).frame(width: 200, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).background(colorBtn).font(.system(size: 18, weight: .black))
        }.cornerRadius(8)
    }
}
