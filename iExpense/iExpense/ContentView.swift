//
//  ContentView.swift
//  iExpense
//
//  Created by Frederico Kuckelhaus on 27.04.21.
//

import SwiftUI

struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}


struct ContentView: View {
    @ObservedObject var expensesInsideContentView = Expenses()
    @State private var addViewisShowing = false
    var body: some View {
        NavigationView {
            List {
                ForEach(expensesInsideContentView.items){ item in
                    Text(item.name)
                }.onDelete(perform: { indexSet in
                    expensesInsideContentView.items.remove(atOffsets: indexSet)
                })
            }.navigationBarItems(leading: Text("iExpense"), trailing: Button(action: {
                addViewisShowing.toggle()
            }, label: {
                Image(systemName: "plus.circle").font(.title)
            }))
        }.sheet(isPresented: $addViewisShowing, content: {
            AddView(expenses: expensesInsideContentView)
        })

    }




    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
