//
//  ContentView.swift
//  SwiftUI-weather
//
//  Created by Frederico Kuckelhaus on 10.04.21.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue, bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack{
                CityTextView(cityName: "Cupertino, CA")
                CurrentWeatherView(temperature: 76, image: "cloud.sun.fill")
                HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.drizzle.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.rain.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", temperature: 76)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "tornado", temperature: 76)
                }.padding(.horizontal)
                Spacer()
                WeatherButton(isNight: $isNight, text: "Change Day Time", colorBtn: .white)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    var body: some View {
        VStack (alignment: .center, spacing: nil) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .foregroundColor(.white)
            VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 3) {
                Image(systemName: imageName)
                    .renderingMode(/*@START_MENU_TOKEN@*/.original/*@END_MENU_TOKEN@*/)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40, alignment: .center)
                Text("\(temperature)°").font(.system(size: 28, weight: .semibold, design: .rounded)).foregroundColor(.white)
                
            }
        }
    }
}

struct BackgroundView: View {
    var topColor: Color
    var bottomColor: Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [topColor, .blue, bottomColor]), startPoint: /*@START_MENU_TOKEN@*/.topLeading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.bottomTrailing/*@END_MENU_TOKEN@*/)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .semibold, design: .default))
            .foregroundColor(.white)
            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct CurrentWeatherView: View {
    var temperature: Int
    var image: String
    
    var body: some View {
        VStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 8) {
            Image(systemName: image)
                .renderingMode(/*@START_MENU_TOKEN@*/.original/*@END_MENU_TOKEN@*/)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            Text("\(temperature)°").font(.system(size: 70, weight: .semibold, design: .rounded)).foregroundColor(.white)
            
        }.padding(.bottom, 40)
    }
}


