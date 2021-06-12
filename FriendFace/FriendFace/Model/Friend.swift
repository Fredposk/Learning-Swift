//
//  Friend.swift
//  FriendFace
//
//  Created by Frederico Kuckelhaus on 11.06.21.
//

import Foundation






// MARK: - FriendFaceElement
struct User: Codable, Identifiable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company, email, address, about: String
    let registered: String
    let tags: [String]
//    let friends: [Friend]


    var formattedRegisteredDate: String {
        guard registered.isEmpty == false else { return "" }
        if let date = formatDate.formatter.date(from: registered) {
            return formatDate.betterFormat.string(from: date)
        } else {
            return ""
        }
    }

// MARK: - Friend
struct Friend: Codable {
    let id, name: String
}
    static let testUser =
        User(id: "50a48fa3-2c0f-4397-ac50-64da464f9954", isActive: false, name: "Alford Rodriguez", age: 24, company: "Imkan", email: "alfordrodriguez@imkan.com", address: "907 Nelson Street, Cotopaxi, South Dakota, 5913", about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco.\r\n", registered: "2015-11-10T01:47:18-00:00", tags: [
                                        "cillum",
                                        "consequat",
                                        "deserunt",
                                        "nostrud",
                                        "eiusmod",
                                        "minim",
                                        "tempor"
                                     ]
//        ,
//        friends: [Friend(id: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0", name: "Hawkins Patel")]
        )

}


