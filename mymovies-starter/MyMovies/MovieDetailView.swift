//
//  MovieDetailView.swift
//  MyMovies
//
//  Created by Frederico Kuckelhaus on 17.05.21.
//

import SDWebImageSwiftUI
import SwiftUI

struct MovieDetailView: View {
    let movie: Movie

    @State private var details = Bundle.main.decode(MovieDetails.self, from: "details.json")

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading, spacing: 0) {

                    if let path = movie.backdropPath {
                        WebImage(url: URL(string: "https://image.tmdb.org/t/p/w1280\(path)"))
                            .placeholder {
                                Color.gray.frame(maxHeight : 200)
                            }
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 200)
                    }
                    HStack(spacing: 20) {
                        Text("Revenue: $\(details.revenue)")
                        Text("\(details.runtime) minutes")
                    }

                }
                .foregroundColor(.white)
                .font(.caption.bold())
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)

            }
            Text(movie.overview)
                .padding([.horizontal, .bottom])
        }
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailView(movie: .example)
        }

    }
}
