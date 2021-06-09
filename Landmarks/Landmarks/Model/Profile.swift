//
//  Profile.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 09.06.21.
//

import Foundation

struct Profile {
    var userName: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    static let testProfile = Profile(userName: "Freddy.bdb")

    enum Season: String, CaseIterable, Identifiable {
        var id: String {self.rawValue}

        case spring = "🌸"
        case summer = "☀️"
        case fall = "🍂"
        case winter = "❄️"
    }
}
