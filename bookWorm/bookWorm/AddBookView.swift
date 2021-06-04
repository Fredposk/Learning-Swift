//
//  AddBookView.swift
//  bookWorm
//
//  Created by Frederico Kuckelhaus on 04.06.21.
//

import SwiftUI

struct AddBookView: View {

    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode

    @State private var author = ""
    @State private var title = ""
    @State private var rating = 3
    @State private var genre = ""
    @State private var review = ""

    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of Book", text: $title)
                    TextField("Author's Name", text: $author)
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                Section {
                   RatingView(rating: $rating)
                        TextField("Write a review", text: $review)
                    
                }
                Section {
                    Button(action: {
                        let newBook = Book(context: self.moc)

                        newBook.title = self.title
                        newBook.author = self.author
                        newBook.rating = Int16(self.rating)
                        newBook.genre = self.genre
                        newBook.review = self.review

                        try? moc.save()

                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Add Book")
                    })
                }
            }
            .navigationBarTitle("Add Book")
        }
    }
}

struct AddBookView_Previews: PreviewProvider {
    static var previews: some View {
        AddBookView()
    }
}
