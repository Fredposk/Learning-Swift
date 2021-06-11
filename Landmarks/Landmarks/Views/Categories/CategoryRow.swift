//
//  CategoryRow.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 09.06.21.
//

import SwiftUI

struct CategoryRow: View {

    var categoryName: String
    var items: [Landmark]

    var body: some View {

        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: -15) {
                    ForEach(items) { landmark in
                        NavigationLink(
                            destination: LandmarkDetailView(landmark: landmark),
                            label: {
                                CategoryItem(landmark: landmark)
                                    .buttonStyle(PlainButtonStyle())
                            })
                            



                    }
                }
            }.frame(height: 185)
        }

    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(categoryName: ModelData().landmarks[0].category.rawValue, items: Array(ModelData().landmarks.prefix(4)))
    }
}
