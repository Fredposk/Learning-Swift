//
//  ContentView.swift
//  studyCard
//
//  Created by Frederico Kuckelhaus on 21.05.21.
//

import SwiftUI

struct CardListView: View {

    @ObservedObject var cardListViewModel: CardListViewModel

    var body: some View {
        VStack {
            List(cardListViewModel.studyCards){ card in
                Text(card.question)
            }
            Button("Add Mock Question") {
                let card = StudyCard(question: "3 + 4", answer: "7")
                cardListViewModel.add(studyCard: card)
            }
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView(cardListViewModel: CardListViewModel())
    }
}
