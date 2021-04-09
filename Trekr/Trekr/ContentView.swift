//
//  ContentView.swift
//  Trekr
//
//  Created by Frederico Kuckelhaus on 09.04.21.
//

import SwiftUI

struct ContentView: View {
    let location: Location
    var body: some View {
        ScrollView {
            Image(location.heroPicture)
                .resizable()
                .scaledToFit()
            Text(location.country).font(.largeTitle).fontWeight(.bold).multilineTextAlignment(.center)
            Text(location.description).foregroundColor(.secondary).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .font(.body)
                .padding(.horizontal)
            Text("Did you know").font(/*@START_MENU_TOKEN@*/.title3/*@END_MENU_TOKEN@*/).bold().padding(.top)
            Text(location.more).font(.body).padding(.horizontal)
        }.navigationTitle("Discover")
        
    }
}







struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView(location: Locations().primary)
        }
        
    }
}
