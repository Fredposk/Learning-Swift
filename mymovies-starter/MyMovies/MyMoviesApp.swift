//
//  MyMoviesApp.swift
//  MyMovies
//
//  Created by Paul Hudson on 12/05/2021.
//

import SwiftUI

@main
struct MyMoviesApp: App {

    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                    .tabItem {
                        Text("Search")
                        Image(systemName: "magnifyingglass")
                    }
                    FavoritesView()
                    .tabItem {
                        Text("Favorites")
                        Image(systemName: "star")
                    }
            }
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)

        }
    }
}
