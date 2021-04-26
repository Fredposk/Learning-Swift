//
//  SummaryView.swift
//  UIpractice
//
//  Created by Frederico Kuckelhaus on 26.04.21.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        VStack {
            todayText()
            Text("Summary".uppercased()).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }.frame( maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading).padding()
    }
    func todayText() -> some View {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, MMM d"
        return Text(formatter.string(from: Date()).uppercased()).font(.subheadline).foregroundColor(.secondary)
    }

}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SummaryView()
                .previewLayout(.sizeThatFits)
        }
    }
}
