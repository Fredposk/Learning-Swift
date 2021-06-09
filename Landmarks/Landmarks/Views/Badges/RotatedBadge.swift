//
//  RotatedBadge.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 08.06.21.
//

import SwiftUI

struct MyCustomShape: Shape {

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.197*width, y: 0.325*height))
        path.addLine(to: CGPoint(x: 0.111*width, y: 0.182*height))
        path.addLine(to: CGPoint(x: 0.182*width, y: 0.111*height))
        path.addLine(to: CGPoint(x: 0.325*width, y: 0.197*height))
        path.addCurve(to: CGPoint(x: 0.41*width, y: 0.162*height), control1: CGPoint(x: 0.351*width, y: 0.182*height), control2: CGPoint(x: 0.38*width, y: 0.17*height))
        path.addLine(to: CGPoint(x: 0.45*width, y: 0))
        path.addLine(to: CGPoint(x: 0.55*width, y: 0))
        path.addLine(to: CGPoint(x: 0.59*width, y: 0.162*height))
        path.addCurve(to: CGPoint(x: 0.675*width, y: 0.197*height), control1: CGPoint(x: 0.62*width, y: 0.17*height), control2: CGPoint(x: 0.649*width, y: 0.182*height))
        path.addLine(to: CGPoint(x: 0.818*width, y: 0.111*height))
        path.addLine(to: CGPoint(x: 0.889*width, y: 0.182*height))
        path.addLine(to: CGPoint(x: 0.803*width, y: 0.325*height))
        path.addCurve(to: CGPoint(x: 0.838*width, y: 0.41*height), control1: CGPoint(x: 0.818*width, y: 0.351*height), control2: CGPoint(x: 0.83*width, y: 0.38*height))
        path.addLine(to: CGPoint(x: width, y: 0.45*height))
        path.addLine(to: CGPoint(x: width, y: 0.55*height))
        path.addLine(to: CGPoint(x: 0.838*width, y: 0.59*height))
        path.addCurve(to: CGPoint(x: 0.803*width, y: 0.675*height), control1: CGPoint(x: 0.83*width, y: 0.62*height), control2: CGPoint(x: 0.818*width, y: 0.649*height))
        path.addLine(to: CGPoint(x: 0.889*width, y: 0.818*height))
        path.addLine(to: CGPoint(x: 0.818*width, y: 0.889*height))
        path.addLine(to: CGPoint(x: 0.675*width, y: 0.803*height))
        path.addCurve(to: CGPoint(x: 0.59*width, y: 0.838*height), control1: CGPoint(x: 0.649*width, y: 0.818*height), control2: CGPoint(x: 0.62*width, y: 0.83*height))
        path.addLine(to: CGPoint(x: 0.55*width, y: height))
        path.addLine(to: CGPoint(x: 0.45*width, y: height))
        path.addLine(to: CGPoint(x: 0.41*width, y: 0.838*height))
        path.addCurve(to: CGPoint(x: 0.325*width, y: 0.803*height), control1: CGPoint(x: 0.38*width, y: 0.83*height), control2: CGPoint(x: 0.351*width, y: 0.818*height))
        path.addLine(to: CGPoint(x: 0.182*width, y: 0.889*height))
        path.addLine(to: CGPoint(x: 0.111*width, y: 0.818*height))
        path.addLine(to: CGPoint(x: 0.197*width, y: 0.675*height))
        path.addCurve(to: CGPoint(x: 0.162*width, y: 0.59*height), control1: CGPoint(x: 0.182*width, y: 0.649*height), control2: CGPoint(x: 0.17*width, y: 0.62*height))
        path.addLine(to: CGPoint(x: 0, y: 0.55*height))
        path.addLine(to: CGPoint(x: 0, y: 0.45*height))
        path.addLine(to: CGPoint(x: 0.162*width, y: 0.41*height))
        path.addCurve(to: CGPoint(x: 0.197*width, y: 0.325*height), control1: CGPoint(x: 0.17*width, y: 0.38*height), control2: CGPoint(x: 0.182*width, y: 0.351*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.5*width, y: 0.65*height))
        path.closeSubpath()
        return path
    }
}

struct MyCustomShape_Previews: PreviewProvider {
    static var previews: some View {
        MyCustomShape()
    }
}
