//
//  Genre.swift
//  MyMovies
//
//  Created by Frederico Kuckelhaus on 17.05.21.
//

import Foundation

struct Genre: Decodable, Identifiable {
    var id: String {name}
    let name: String
    let color: String

    static let all =
        Dictionary(uniqueKeysWithValues:   Bundle.main.decode([String:Genre].self, from: "genres.json").map {
            (Int($0) ?? 0, $1)
        })}
