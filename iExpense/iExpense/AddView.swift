//
//  AddView.swift
//  iExpense
//
//  Created by Frederico Kuckelhaus on 28.04.21.
//

import SwiftUI

struct AddView: View {
    @ObservedObject var expenses: Expenses
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = ""
     let types = ["Business", "Personal"]
    var body: some View {

        NavigationView {
            Form {
                TextField("Add Name", text: $name)
                Picker("Type", selection: $type){
                    ForEach(types, id: \.self){
                        Text($0)
                    }
                }
                TextField("Add Amount", text: $amount).keyboardType(.numberPad)
            }.navigationBarTitle("Add Expense")
            .navigationBarItems(trailing: Button(action: {
                if let actualAmount = Int(amount) {
                    let newExpense = ExpenseItem(name: name, type: type, amount: actualAmount)
                    self.expenses.items.append(newExpense)
                }


            }, label: {
                Text("Save")
            }))
        }


    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())
    }
}
