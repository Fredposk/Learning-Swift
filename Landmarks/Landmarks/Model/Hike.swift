//
//  Hike.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 08.06.21.
//

import Foundation


// MARK: - HikeDatum
struct Hike: Codable, Identifiable {
    let name: String
    let id: Int
    let distance: Double
    let difficulty: Int
    let observations: [Observation]

static var formatter = LengthFormatter()

    var distanceText: String {
        Hike.formatter.unitString(fromValue: distance, unit: .kilometer)
    }


// MARK: - Observation
struct Observation: Codable {
    let elevation, pace, heartRate: Range<Double>
    let distanceFromStart: Double
}
}
typealias HikeData = [Hike]
