//
//  DateHelper.swift
//  FriendFace
//
//  Created by Frederico Kuckelhaus on 11.06.21.
//

import Foundation


enum formatDate {

    static let formatter: DateFormatter = {
   let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    return formatter
}()

    static let betterFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
}
