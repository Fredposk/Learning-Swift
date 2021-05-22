//
//  ContentView.swift
//  HttpPractice
//
//  Created by Frederico Kuckelhaus on 20.05.21.
//


import SwiftUI



struct ContentView: View {





    @State var data = Taco(condiment: Condiment(name: "Banana"))



    var body: some View {

        //        Text("\(data.condiment.name)")
        VStack {
            Text("\(data.condiment.name)")
            Button(action: runSearch, label: {
                Text("Refresh")
            })
        }


    }
    func runSearch(){

        let url = URL(string: "http://taco-randomizer.herokuapp.com/random/")
        DispatchQueue.main.async {
            URLSession.shared.dataTask(with: url!) { data, _, error in
                if let data = data {
                    do {
                        let decoder = JSONDecoder()
                        let decodedData = try decoder.decode(Taco.self, from: data)
                        self.data = decodedData
                    } catch {
                    }
                }
            }.resume()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
