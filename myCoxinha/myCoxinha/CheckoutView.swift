//
//  CheckoutView.swift
//  myCoxinha
//
//  Created by Frederico Kuckelhaus on 02.06.21.
//

import SwiftUI
import SDWebImageSwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order

    @State private var confirmationMessage = ""
    @State private var showingConfirmation = false


    var body: some View {

        GeometryReader { geo in
            ScrollView {
                WebImage(url: URL(string: "https://docereceita.com.br/blog/wp-content/uploads/2019/07/massa-de-coxinha.jpg"))
                    .resizable()
                    .placeholder {
                        Color.gray.frame(width: geo.size.width)
                    }
                    .frame(width: geo.size.width, height: geo.size.height/3)
                    .scaledToFit()

                Text("Order Details:")
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                Text("\(order.totalPrice, specifier: "%.2f")")

                Button(action: {sendOrder()}, label: {
                    Text("Send Order")
                })
                .padding()
                .background(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                .cornerRadius(25)
            }
            .navigationBarTitle("Check out", displayMode: .inline)
        }
        .alert(isPresented: $showingConfirmation) {
            Alert(title: Text("Thank you"), message: Text(confirmationMessage), dismissButton: .default(Text("OK")))
        }


    }
    func sendOrder(){
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("Failed to encode")
            return
        }
        let url = URL(string: "https://reqres.in/api/coxinhas")!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = encoded

        URLSession.shared.dataTask(with: request) { data, URLResponse, Error in
            guard let data = data else {
                print("No data in response: \(Error?.localizedDescription ?? "Unkonwn error")")
                return
            }
            if let decodedResponse = try? JSONDecoder().decode(Order.self, from: data) {
                self.confirmationMessage = "Your order for \(decodedResponse.orderAmount) coxinhas has been received"
                self.showingConfirmation = true
            } else {
                print("Invalid response")
            }

        }.resume()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CheckoutView(order: Order())
        }
    }
}
