//
//  DetailView.swift
//  BookWorm
//
//  Created by Frederico Kuckelhaus on 04.06.21.
//

import SwiftUI
import CoreData

struct DetailView: View {

    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowingAlert = false

    let book: Book
    var body: some View {
        GeometryReader { geo in
            VStack {
                ZStack(alignment: .bottomTrailing) {
                    Image(book.genre ?? "Fantasy")
                        .frame(maxWidth: geo.size.width)
                    Text(book.genre?.uppercased() ?? "Fantasy")
                        .font(.caption)
                        .fontWeight(.black)
                        .padding(8)
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.75))
                        .cornerRadius(25)
                        .offset(x: -5, y: -5)
                }
                Text(book.author ?? "Unknown Author")
                    .font(.title)
                    .foregroundColor(.secondary)
                Text(book.review ?? "No Reviews yet")
                    .padding()

                RatingView(rating: .constant(Int(book.rating)))
                    .font(.title)
            }
            .navigationBarTitle(Text(book.title ?? "Unknown Book"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                self.isShowingAlert = true

            }, label: {
                Image(systemName: "trash")
            }))
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Delete Book"), message: Text("Are you sure"), primaryButton: .destructive(Text("Delete")) {
                self.deleteBook()
            }, secondaryButton: .cancel(Text("Cancel")))
        }


    }
    func deleteBook(){
        moc.delete(book)
        try? self.moc.save()
        presentationMode.wrappedValue.dismiss()
    }
}

struct DetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

    static var previews: some View {
        let book = Book(context: moc)
        book.title = "Test Book"
        book.author = "Test Author"
        book.genre = "Fantasy"
        book.rating = 4
        book.review = "This is a great book"

        return
            NavigationView {
                DetailView(book: book)
            }

    }
}
