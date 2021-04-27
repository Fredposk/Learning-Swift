//
//  TestingView.swift
//  iExpense
//
//  Created by Frederico Kuckelhaus on 27.04.21.
//

import SwiftUI

struct TestingSecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        Button( "Click ME") {
            presentationMode.wrappedValue.dismiss()
        }
    }
}


struct TestingView: View {
    @State private var showingSheet = false
    @State private var numbers = [Int]()
    @State private var currentNumber = 0

    var body: some View {
        NavigationView{
            VStack {
                List{
                    ForEach(numbers, id: \.self) {
                        Text("\($0)")
                    }
                    .onDelete(perform: { IndexSet in
                        numbers.remove(atOffsets: IndexSet)
                    })
                    Button("add number") {

                      numbers.append(currentNumber)
                        currentNumber += 1
                    }
                }
                Button("Show Sheet"){
                    showingSheet.toggle()
                }.sheet(isPresented: $showingSheet) {
                    TestingSecondView()
                }
            }.navigationBarItems(leading: EditButton())
        }

    }




    struct TestingView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
