//
//  ContentView.swift
//  rockPaperScissors
//
//  Created by Frederico Kuckelhaus on 18.04.21.
//

import SwiftUI

struct ContentView: View {
    @State private var RockPaperScissors = ["rock", "paper", "scissor"]
    @State private var iswinOrlose = false
    @State private var playerScore = 0
    @State private var isGameOver = false
    @State private var isChosenAnswer = ""
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(hue: 0.15114618783973788, saturation: 1.0, brightness: 0.8, opacity: 1.0), location: 0.0), Gradient.Stop(color: Color(hue: 0.4813993752720845, saturation: 0.4479254067662251, brightness: 0.6411724090576172, opacity: 1.0), location: 0.9372030404897836)]), startPoint: UnitPoint.topLeading, endPoint: UnitPoint.bottomTrailing).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("You have to \( iswinOrlose ? Text("Win") : Text("Lose"))").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).italic().foregroundColor(.white)
                ZStack {
                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).foregroundColor(.blue)
                    Text("\(RockPaperScissors[0])")
                }.padding(.vertical, 80)
                
                HStack {
                    ForEach(0..<RockPaperScissors.count) {
                        number in Button(RockPaperScissors[number], action: {
                            isChosenAnswer = RockPaperScissors[number]
                            GameLogic(userChoice: isChosenAnswer)
                        }).padding().background(isChosenAnswer == RockPaperScissors[number] ? Color.gray : Color.white).foregroundColor(.black).cornerRadius(15)
                    }
                }
                Spacer()
                Button("New Round", action: {
                    newRound()
                }).padding().background(Color.white).foregroundColor(.black).cornerRadius(15)
                Spacer()
                Text("Player Score: \(playerScore)").font(.title2).italic().foregroundColor(.white)
            }
            
        }
    }
    func winOrLose()  {
        iswinOrlose = Bool.random()
    }
    func newRound() {
        winOrLose()
        RockPaperScissors.shuffle()
        isChosenAnswer = ""
    }
    func gameOver() {
        if playerScore >= 10 {
            isGameOver = true
        }
    }
    func GameLogic(userChoice: String){


        if iswinOrlose {
            switch userChoice {
            case "rock":
                print("chose rock")
            case "paper":
                print("chose paper")
            case "scissors":
                print("chose scissor")
            default:
                print("no points")
            }
        } else {
            switch userChoice {
            case "rock":
                print("chose rock lose")
            case "paper":
                print("chose paper lose")
            case "scissors":
                print("chose scissor lose")
            default:
                print("no points")
            }
        }




    }
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
