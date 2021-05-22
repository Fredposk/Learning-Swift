//
//  CardRepository.swift
//  studyCard
//
//  Created by Frederico Kuckelhaus on 22.05.21.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import Combine


class CardRepository: ObservableObject {
    private let store = Firestore.firestore()
    private let path = "studyCards"
    @Published var studyCard: [StudyCard] = []

    init() {
        get()
    }

    func get() {
        store.collection(path).addSnapshotListener { snapShot, error in
            if let error = error {
                print(error)
                return
            }
            self.studyCard = (snapShot?.documents.compactMap {
                try? $0.data(as: StudyCard.self)
            }) ?? []
        }
    }
    func add( studyCard: StudyCard){
        do {
            _ = try store.collection(path).addDocument(from: studyCard)
        } catch  {
            fatalError("studyCard failed")
        }
    }
}
