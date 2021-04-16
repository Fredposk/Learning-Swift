//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Frederico Kuckelhaus on 16.04.21.
//

import SwiftUI

struct ContentView: View {
    @State private var countries: [String] = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var currentScore = 0
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.0, saturation: 1.0, brightness: 0.8, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.4597406042627542, saturation: 0.4109656092632248, brightness: 1.0, opacity: 0.3254193685140955), location: 0.2476457155667819), Gradient.Stop(color: Color(hue: 0.5, saturation: 1.0, brightness: 0.8, opacity: 1.0), location: 0.47977330134465146), Gradient.Stop(color: Color(hue: 0.95, saturation: 1.0, brightness: 0.8, opacity: 1.0), location: 0.6998056265024039), Gradient.Stop(color: Color(hue: 0.581819901983422, saturation: 0.8751098448971669, brightness: 0.5970725323780474, opacity: 1.0), location: 0.948028564453125)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack (spacing: 30) {
                VStack {
                   Text("Tap the flag of..")
                    Text(countries[correctAnswer]).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                }.foregroundColor(.black)
            ForEach(0..<3){
                number in Button(action: {
                    flagTapped(number: number)
                }){
                    Image(countries[number])
                        .renderingMode(.original)
                        .clipShape(Capsule())
                }
            }
            .clipShape(Capsule()).overlay(Capsule().stroke())
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 3, y: 3)
                
                Spacer()
                Button("New Game", action: {
                    newGame()
                }).padding(15).background(Color.black).foregroundColor(Color.white).cornerRadius(40).shadow(radius: 20)
            }
          
        }.alert(isPresented: $showingScore) {
            Alert(title: Text("\(scoreTitle)"), message: Text("Your Score is \(currentScore)"), dismissButton: .default(Text("Continue")) {
                askQuestion()
            })
        }
}
    func flagTapped(number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
            currentScore += 1
        } else {
            scoreTitle = "Incorrect"
        }
        showingScore = true
    }
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
    func newGame(){
        countries.shuffle()
        currentScore = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
