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
                    .frame(width: geo.size.width/1.4, height: geo.size.height/2.6)
                    .foregroundColor(.secondary)
                    .offset(y: -180)
            }
        }
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
