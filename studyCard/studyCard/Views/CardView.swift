//
//  CardView.swift
//  studyCard
//
//  Created by Frederico Kuckelhaus on 23.05.21.
//

import SwiftUI

struct CardView: View {

    @State private var flipped = false

    var cardViewModel: CardViewModel

    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(flipped ? Color.white : Color.purple)
            .frame(height: 120)
            .overlay(
                ZStack {
                    HStack {
                        Spacer()
                        VStack {
                            Image(systemName: cardViewModel.studyCard.passed ? "star.fill" : "star")
                            Spacer()
                        }
                    }
                    Text(flipped ? cardViewModel.studyCard.answer : cardViewModel.studyCard.question)
                        .foregroundColor(flipped ? Color.black : Color.white)
                }
                .padding()
            ).onTapGesture {
                withAnimation {
                    flipped.toggle()
                }
            }
    }
}

