//
//  CircleImage.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 07.06.21.
//

import SwiftUI

struct CircleImage: View {
    var image: Image


    var body: some View {
        image
            .frame(width: 200)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 2))
            .shadow(radius: 7)
    }
}


struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turlerock"))
    }
}
