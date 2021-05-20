//
//  Tacos.swift
//  HttpPractice
//
//  Created by Frederico Kuckelhaus on 20.05.21.
//

import Foundation

struct Taco: Decodable {
    let condiment: Condiment
}

struct Condiment: Decodable {
    let name: String
}
