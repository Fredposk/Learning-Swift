//
//  ContentView.swift
//  FriendFace
//
//  Created by Frederico Kuckelhaus on 11.06.21.
//

import SwiftUI
import Combine

struct ContentView: View {

    @EnvironmentObject var dataController: DataController
    @FetchRequest (entity: SavedUser.entity(), sortDescriptors: [])
    var fetchedResults: FetchedResults<SavedUser>
//    @State private var results = [User]()
    var results: [User] {
        fetchedResults.map { user in
            let tags = user.tags?.components(separatedBy: ",")
            return User(id: user.id ?? "", isActive: user.isActive, name: user.name ?? "", age: Int(user.age), company: user.company ?? "", email: user.email ?? "", address: user.address ?? "", about: user.about ?? "", registered: user.registered ?? "", tags: tags ?? [])
        }
    }
    @State private var request: AnyCancellable?
    @State private var showActiveOnly = false

    var activeOnly: [User] {
        results.filter { user in
            user.isActive || showActiveOnly == false

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

                                for user in decodedData {
                                    dataController.addToCoreData(user)
                                }

//                                results = decodedData
                            } catch {
//                                results = []
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
            .environmentObject(DataController(inMemory: true))
    }
}
