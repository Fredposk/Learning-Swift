//
//  MovieDetails.swift
//  MyMovies
//
//  Created by Frederico Kuckelhaus on 17.05.21.
//

import Foundation

struct MovieDetails: Decodable {
    let budget: Int
    let revenue: Int
    let runtime: Int
}
