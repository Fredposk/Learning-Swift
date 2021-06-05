//
//  ContentView.swift
//  BookWorm
//
//  Created by Frederico Kuckelhaus on 04.06.21.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.managedObjectContext) var moc
   

    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.title, ascending: true),
        NSSortDescriptor(keyPath: \Book.author, ascending: true)
    ]) var books: FetchedResults<Book>
    @State private var showingAddScreen = false

    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                            .font(.title)

                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown title")
                                .font(.headline)
                            Text(book.author ?? "Unknown author")
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }

                .navigationBarTitle("BookWorm")
                .navigationBarItems(leading: EditButton(), trailing: Button(action: {
                    showingAddScreen.toggle()
                }, label: {
                    Image(systemName: "plus.circle")
                })
                .padding()
                .font(.title))
                .sheet(isPresented: $showingAddScreen, content: {
                    AddBookView()
                })
        }
    }
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            moc.delete(book)
        }
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
