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
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowing = false
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
            .navigationBarItems(leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
            }),trailing: Button(action: {
                if let actualAmount = Int(amount) {
                    let newExpense = ExpenseItem(name: name, type: type, amount: actualAmount)
                    self.expenses.items.append(newExpense)
                    presentationMode.wrappedValue.dismiss()
                } else {
                    isShowing = true
                }
            }, label: {
                Text("Save")
            }))
        }.alert(isPresented: $isShowing) {
            Alert(title: Text("Alert"), message: Text("Please enter valid amount"), dismissButton: .cancel())
        }


    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expenses: Expenses())

    }
}
