//
//  ContentView.swift
//  FriendFace
//
//  Created by Frederico Kuckelhaus on 11.06.21.
//

import SwiftUI
import Combine

struct ContentView: View {

    @State private var results = [User]()
    @State private var request: AnyCancellable?
    @State private var showActiveOnly = false

    var activeOnly: [User] {
        results.filter { user in
            user.isActive || !showActiveOnly
        }
    }

    var body: some View {
        NavigationView {
            List {
                Toggle("Active Only", isOn: $showActiveOnly)
                ForEach(activeOnly) { user in
                    NavigationLink( "\(user.name)", destination: UserView(user: user))

                }

            }
            .navigationTitle("FriendFace")
        }
        .onAppear(perform: {
            request?.cancel()
                let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")
                DispatchQueue.main.async {
                    URLSession.shared.dataTask(with: url!) { data, _, error in
                        if let data = data {
                            do {
                                let decoder = JSONDecoder()
                                decoder.keyDecodingStrategy = .convertFromSnakeCase
                                let decodedData = try decoder.decode([User].self, from: data)
                                results = decodedData
                            } catch {
                                results = [User.testUser]
                            }
                        }
                    }.resume()
                }


        })
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
