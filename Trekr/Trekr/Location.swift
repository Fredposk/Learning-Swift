//
//  Location.swift
//  Trekr
//
//  Created by Frederico Kuckelhaus on 09.04.21.
//

import Foundation

struct Location: Decodable, Identifiable {
    let id: Int
    let name: String
    let country: String
    let description: String
    let more: String
    let latitude: Double
    let longitude: Double
    let heroPicture: String
    let advisory: String
    
 static let example = Location(id: 1, name: "Great Smokey Mountains", country: "United States", description: "A great place to visit", more: "More text here", latitude: -83.5070, longitude: 35.6532, heroPicture: "smokies", advisory: "Beware of the bears!")
}


