//
//  TrekrApp.swift
//  Trekr
//
//  Created by Frederico Kuckelhaus on 09.04.21.
//

import SwiftUI

@main
struct TrekrApp: App {
   @StateObject var location = Locations()
    var body: some Scene {
        WindowGroup {
            TabView{
                NavigationView{
                    ContentView(location: location.primary)
                }
                .tabItem {
                    Image(systemName: "airplane.circle.fill")
                    Text("Discover")
                }
                NavigationView{
                    WorldView()
                }
                .tabItem { Image(systemName: "star.fill")
                    Text("Locations")
                }
            }
            .environmentObject(location)
            
        }
    }
}
