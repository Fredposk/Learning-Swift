//
//  CardViewModel.swift
//  studyCard
//
//  Created by Frederico Kuckelhaus on 23.05.21.
//

import Foundation
import Combine


class CardViewModel: ObservableObject, Identifiable {
    private let cardRepository = CardRepository()
    @Published var studyCard: StudyCard
    private var cancellables: Set<AnyCancellable> = []
    var id = ""

    init(studyCard: StudyCard){
        self.studyCard = studyCard
        $studyCard
            .compactMap { $0.id }
            .assign(to: \.id, on: self)
            .store(in: &cancellables)
    }
}
