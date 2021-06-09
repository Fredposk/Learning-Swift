//
//  Badge.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 08.06.21.
//

import SwiftUI

struct Badge: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                BadgeBackground()
                MyCustomShape()
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.gray)

            }
        }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
