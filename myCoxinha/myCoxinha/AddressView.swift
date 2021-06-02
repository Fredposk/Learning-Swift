//
//  AddressView.swift
//  myCoxinha
//
//  Created by Frederico Kuckelhaus on 02.06.21.
//

import SwiftUI

struct AddressView: View {

    @ObservedObject var order: Order

    var body: some View {


            Form {
                Section(header: Text("enter Details:")) {
                    TextField("Name", text: $order.name)
                    TextField("Address", text: $order.address)
                    TextField("email", text: $order.email)
                }
                Section {
                    NavigationLink ("Checkout", destination: CheckoutView(order: order))
                        .disabled(order.validDetails == false)
                }
                .navigationBarTitle(Text("Delivery Details"), displayMode: .inline)
            }






    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
