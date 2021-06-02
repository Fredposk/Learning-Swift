//
//  MyMoviesApp.swift
//  MyMovies
//
//  Created by Paul Hudson on 12/05/2021.
//

import SwiftUI

@main
struct MyMoviesApp: App {
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

        }
    }
}
