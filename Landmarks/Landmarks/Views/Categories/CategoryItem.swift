//
//  CategoryItem.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 09.06.21.
//

import SwiftUI

struct CategoryItem: View {
    var landmark: Landmark
    var body: some View {
            VStack(alignment: .leading) {
                landmark.image
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 155, height: 155, alignment: .center)
                    .cornerRadius(10)


                Text(landmark.name)
                    .font(.caption.bold())
                    .foregroundColor(.primary)

            }
            .padding()

    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(landmark: ModelData().landmarks[0])
    }
}
