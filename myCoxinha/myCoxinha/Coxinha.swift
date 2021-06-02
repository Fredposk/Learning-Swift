//
//  Coxinha.swift
//  myCoxinha
//
//  Created by Frederico Kuckelhaus on 02.06.21.
//

import Foundation

class Order: ObservableObject, Codable {

    static let options = ["frango", "carne", "queijo"]

    @Published var orderAmount = 3
    @Published var flavour = 0

    @Published var special = false {
        didSet {
            if special == false {
                catupiry = false
                pepperSauce = false
            }
        }
    }

    @Published var catupiry = false
    @Published var pepperSauce = false
    @Published var name = ""
    @Published var address = ""
    @Published var email = ""

   var totalPrice: Double {
        var cost = orderAmount * 2

        if special {
            cost += (orderAmount / 2)     }
        return Double(cost)
    }

    var validDetails: Bool {
        if name.isEmpty || address.isEmpty || email.isEmpty {
            return false
        }
        return true
    }

    init() {}

    enum CodingKeys: CodingKey {
        case orderAmount, flavour, special, catupiry, pepperSauce, name, address, email
    }


    func encode (to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(orderAmount, forKey: .orderAmount)
        try container.encode(flavour, forKey: .flavour)
        try container.encode(special, forKey: .special)
        try container.encode(catupiry, forKey: .catupiry)
        try container.encode(pepperSauce, forKey: .pepperSauce)
        try container.encode(name, forKey: .name)
        try container.encode(address, forKey: .address)
        try container.encode(email, forKey: .email)
    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        orderAmount = try container.decode(Int.self, forKey: .orderAmount)
        flavour = try container.decode(Int.self, forKey: .flavour)
        special = try container.decode(Bool.self, forKey: .special)
        pepperSauce = try container.decode(Bool.self, forKey: .pepperSauce)
        catupiry = try container.decode(Bool.self, forKey: .catupiry)
        name = try container.decode(String.self, forKey: .name)
        address = try container.decode(String.self, forKey: .address)
        email = try container.decode(String.self, forKey: .email)


    }

}
