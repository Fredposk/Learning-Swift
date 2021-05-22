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
    @Published var studyCards: [StudyCard] = []

    private var cancellables: Set<AnyCancellable> = []

    init() {
        cardRepository.$studyCard
            .assign(to: \.studyCards, on: self)
            .store(in: &cancellables)
    }

    func add(studyCard: StudyCard){
        cardRepository.add(studyCard: studyCard)
    }


}
