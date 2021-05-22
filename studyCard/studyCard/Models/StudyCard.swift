//
//  StudyCard.swift
//  studyCard
//
//  Created by Frederico Kuckelhaus on 22.05.21.
//

import Foundation
import FirebaseFirestoreSwift

struct StudyCard: Codable, Identifiable {
    @DocumentID var id: String?
    var question: String
    var answer: String
    var passed: Bool = false
}
