//
//  ContentView.swift
//  BookWorm
//
//  Created by Frederico Kuckelhaus on 04.06.21.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var moc

    @FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>
    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            Text("book \(books.count)")
                .navigationBarTitle("BookWorm")
                .navigationBarItems(trailing: Button(action: {
                    showingAddScreen.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                })
                .padding()
                .font(.title))
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView()
                        .environment(\.managedObjectContext, self.moc)
                })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
