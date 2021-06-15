//
//  GenresView.swift
//  MyMovies
//
//  Created by Frederico Kuckelhaus on 15.06.21.
//

import SwiftUI


struct GenresView: View {
    var movie: Movie
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 3) {
                ForEach(movie.genres) { genre in
                    Text(genre.name)
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 2)
                        .background(Color(genre.color))
                        .clipShape(Capsule())

                }
            }
        }.padding(.horizontal, 20)
    }
}
