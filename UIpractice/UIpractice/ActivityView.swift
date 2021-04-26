//
//  ActivityView.swift
//  UIpractice
//
//  Created by Frederico Kuckelhaus on 26.04.21.
//

import SwiftUI

struct ActivityView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Activity").font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)

            HStack {
                VStack(alignment: .leading, spacing: 5.0) {
                    ActivityTextView(labelOne: "Move", labelTwo: "472/500", labelThree: "cal", color: .red)
                    ActivityTextView(labelOne: "Exercise", labelTwo: "24/25", labelThree: "Min", color: .green)
                    ActivityTextView(labelOne: "Stand", labelTwo: "472/500", labelThree: "Hrs", color: Color(.systemTeal))
                }.padding()
                Spacer()

                ringView(to: 0.86, width: 150, height: 150)

            }.padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(25)

        }.padding()

    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
            .previewLayout(.sizeThatFits)
    }
}

struct ActivityTextView: View {
    let labelOne: String
    let labelTwo: String
    let labelThree: String
    let color: Color


    var body: some View {
        VStack (alignment: .leading) {
            Text(labelOne)
            Text(labelTwo).foregroundColor(color)
                +
                Text(labelThree).font(.caption).foregroundColor(color)
        }
    }
}

struct ringView: View {

    let to: CGFloat
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 12)
                .foregroundColor(Color.red.opacity(0.5))
            Circle()
                .trim(from: 0, to: to)
                .stroke(Color.red, style: StrokeStyle(lineWidth: 12, lineCap: .round))
                .rotationEffect(.degrees(-90))
        } .frame(width: 150, height: 150)
    }
}
