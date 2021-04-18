//
//  ContentView.swift
//  KlimaPage
//
//  Created by Frederico Kuckelhaus on 17.04.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Image("treesBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.vertical)
            VStack(alignment: .center) {
                HStack {
                    Text("Hi maya 👋")
                        .foregroundColor(.white).bold().font(Font.custom("Chalkboard", size: 48))
                        .padding()
                    Spacer()
                }
                Spacer()
                HStack {
                    
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
