//
//  ContentView.swift
//  tic-tac-toe-SwiftUI
//
//  Created by Frederico Kuckelhaus on 06.05.21.
//

import SwiftUI

struct ContentView: View {

    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]

    @State private var moves: [Move?] = Array(repeating: nil, count: 9)
    @State private var isDisabled: Bool = false


    var body: some View {
        GeometryReader {
            geometry in
            VStack {
                Spacer()
                LazyVGrid(columns: columns, spacing: 5) {
                    ForEach(0..<9) { i in
                        ZStack{
                            Circle().foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).frame(width: geometry.size.width/3 - 15, height: geometry.size.width/3 - 15)
                            Image(systemName: moves[i]?.indicator ?? "").resizable().frame(width: 40, height: 40).foregroundColor(.white)
                        }.onTapGesture {
                            isDisabled = true
                            if isOccupied(in: moves, forIndex: i){return}
                            moves[i] = Move(player: .human, boardIndex: i)

//                            TODO: check win or draw
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                let computerPosition = determineComputerMovePosition(in: moves)
                                moves[computerPosition] = Move(player: .computer, boardIndex: computerPosition)
                                isDisabled = false
                            }


                        }
                    }
                }
                Spacer()
            }
            .disabled(isDisabled)
            .padding()

        }

    }

    func isOccupied(in moves: [Move?], forIndex index: Int) -> Bool {
        return moves.contains(where: {$0?.boardIndex == index})
    }

    func determineComputerMovePosition(in moves: [Move?]) -> Int {
        var movePosition = Int.random(in: 0..<9)
        while isOccupied(in: moves, forIndex: movePosition) {
            movePosition = Int.random(in: 0..<9)
        }
        return movePosition
    }

    enum Player {
        case human, computer
    }

    struct Move {
        let player: Player
        let boardIndex: Int
        var indicator: String {
            return player == .human ? "xmark" : "circle"
        }
    }

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
