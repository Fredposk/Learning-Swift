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
        Text("Hello, world!")
            .padding()
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView(cardListViewModel: CardListViewModel())
    }
}
