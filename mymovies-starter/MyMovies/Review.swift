//
//  Review.swift
//  MyMovies
//
//  Created by Frederico Kuckelhaus on 03.06.21.
//

import Foundation

struct Review: Codable, Identifiable {
    let id: String
    let text: String
}
