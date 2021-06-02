//
//  ContentView.swift
//  myCoxinha
//
//  Created by Frederico Kuckelhaus on 02.06.21.
//

import SwiftUI

struct ContentView: View {

   @ObservedObject var order = Order()

    var body: some View {

        NavigationView {
            Form {
                Section(header: Text("Choose Flavour")) {
                    Picker("Enter flavour", selection: $order.flavour) {
                        ForEach(0..<Order.options.count, id: \.self) {
                            Text("\(Order.options[$0])")
                        }
                    }
                }
                    Section(header: Text("Order Amount")) {
                        Stepper("Total: \(order.orderAmount)", value: $order.orderAmount)
                    }
                Section {
                    Toggle("Special requests", isOn: $order.special.animation())
                    if order.special {
                        Toggle("Catupiry", isOn: $order.catupiry)
                        Toggle("Pepper Sauce", isOn: $order.pepperSauce)

                    }
                }

                NavigationLink("Delivery Details", destination: AddressView(order: order))


            }
            .navigationTitle("myCoxinha")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(order: Order())
    }
}
