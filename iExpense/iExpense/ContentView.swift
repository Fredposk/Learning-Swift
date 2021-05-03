//
//  ContentView.swift
//  iExpense
//
//  Created by Frederico Kuckelhaus on 27.04.21.
//

import SwiftUI

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Int
}

class Expenses: ObservableObject {
    @Published var items = [ExpenseItem]() {
        didSet {
            let encoder = JSONEncoder()

            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init(){
        if let items = UserDefaults.standard.data(forKey: "Items")
        {
            let decoder = JSONDecoder()

            if let decoded = try? decoder.decode([ExpenseItem].self, from: items) {
                self.items = decoded
                return
            }
        }
        self.items = []
    }

}


struct ContentView: View {
    @ObservedObject var expensesInsideContentView = Expenses()
    @State private var addViewisShowing = false
    var body: some View {
        NavigationView {
            List {
                ForEach(expensesInsideContentView.items){ item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name).font(.headline)
                            Text(item.type)
                        }
                        Spacer()
                        Text("$\(item.amount)")
                    }
                }.onDelete(perform: { indexSet in
                    expensesInsideContentView.items.remove(atOffsets: indexSet)
                })
            }.navigationBarItems(leading: EditButton(), trailing: Button(action: {
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
