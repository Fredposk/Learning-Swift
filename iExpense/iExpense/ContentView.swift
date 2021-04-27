//
//  ContentView.swift
//  iExpense
//
//  Created by Frederico Kuckelhaus on 27.04.21.
//

import SwiftUI

struct ExpenseItem {
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]()
}


struct ContentView: View {
    @ObservedObject var expenses = Expenses()
    var body: some View {
        NavigationView {
            List {
                ForEach(expenses.items, id:\.name){ item in
                    Text(item.name)
                }.onDelete(perform: { indexSet in
                    expenses.items.remove(atOffsets: indexSet)
                })
            }.navigationBarItems(leading: Text("iExpense"), trailing: Button(action: {
                let newExpense = ExpenseItem(name: "Business lunch", type: "Test", amount: 6)
                expenses.items.append(newExpense)
            }, label: {
                Image(systemName: "plus.circle").font(.title)
            }))

        }

    }




    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
