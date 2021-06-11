//
//  CategoryHome.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 09.06.21.
//

import SwiftUI

struct CategoryHome: View {

    @EnvironmentObject var modelData: ModelData
    @Environment(\.presentationMode) var presentationMode

    @State private var isPresented = false


    var body: some View {
        NavigationView {
            ScrollView {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())

                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                        CategoryRow(categoryName: key, items: modelData.categories[key]!)
                            .padding(.vertical)

            }

                .listStyle(InsetListStyle())

            }
            .navigationTitle("Featured")
            .navigationBarItems(trailing: Button(action: {self.isPresented = true}, label: {
                Image(systemName: "person.circle")
            }).font(.title)
            )
        }
        .sheet(isPresented: $isPresented, content: {
            ProfileHost()
        })
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
