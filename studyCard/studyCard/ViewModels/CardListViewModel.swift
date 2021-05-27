//
//  CardListViewModel.swift
//  studyCard
//
//  Created by Frederico Kuckelhaus on 22.05.21.
//

import Foundation
import Combine

class CardListViewModel: ObservableObject {

    @Published var cardRepository = CardRepository()

    @Published var cardViewModels: [CardViewModel] = []

    private var cancellables: Set<AnyCancellable> = []

    init() {
        cardRepository.$studyCard
            .map { studyCard in
                studyCard.map(CardViewModel.init)
            }
            .assign(to: \.cardViewModels, on: self)
            .store(in: &cancellables)
    }

    func add(studyCard: StudyCard){
        cardRepository.add(studyCard: studyCard)
    }


}
