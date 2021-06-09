//
//  ContentView.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 07.06.21.
//

import SwiftUI

struct ContentView: View {

    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            CategoryHome()
                .tabItem {
                    Text("Featured")
                    Image(systemName: "star")
                }.tag(Tab.featured)
            LandmarkList()
                .tabItem {
                    Text("List")
                    Image(systemName: "list.bullet")
                }.tag(Tab.list)
        }



    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
