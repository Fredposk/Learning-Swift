//
//  MovieDetailView.swift
//  MyMovies
//
//  Created by Frederico Kuckelhaus on 17.05.21.
//

import SDWebImageSwiftUI
import SwiftUI
import Combine

struct MovieDetailView: View {
    let movie: Movie

    @EnvironmentObject var dataController: DataController
    @State private var details: MovieDetails?
    //        Bundle.main.decode(MovieDetails.self, from: "details.json")
    @State private var credits:  Credits?
    //        Bundle.main.decode(Credits.self, from: "credits.json", keyDecodingStrategy: .convertFromSnakeCase)
    @State private var requests = Set<AnyCancellable>()

    @State private var showingAllCast = false
    @State private var showingAllCrew = false

    var displayedCast: [CastMember] {
        guard let credits = credits else { return [] }

        if showingAllCast {
            return credits.cast
        } else {
            return Array(credits.cast.prefix(5))
        }
    }

    var displayedCrew: [CrewMember] {
        guard let credits = credits else { return [] }
        if showingAllCrew {
            return credits.crew
        } else {
            return Array(credits.crew.prefix(5))
        }
    }

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
                    if let details = details {
                        HStack(spacing: 20) {
                            Text("Revenue: $\(details.revenue)")
                            Text("\(details.runtime) minutes")
                        }
                    }
                }
                .foregroundColor(.white)
                .font(.caption.bold())
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.black)

            }
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
            Text(movie.overview)
                .padding([.horizontal, .bottom])

            Group {
                Text("Cast")
                    .font(.title)

                ForEach(displayedCast) { person in
                    VStack(alignment: .leading){
                        Text(person.name)
                            .font(.headline)
                        Text(person.character)
                            .font(.subheadline)
                    }
                    .padding(.bottom, 1)
                }
                if showingAllCast == false {
                    Button("Show all") {
                        withAnimation {
                            showingAllCast.toggle()
                        }
                    }
                    .padding(.vertical)

                }

                Text("Crew")
                    .font(.title)
                ForEach(displayedCrew) { person in
                    VStack(alignment: .leading){
                        Text(person.name)
                            .font(.headline)
                        Text(person.job)
                            .font(.subheadline)
                    }
                    .padding(.bottom, 1)
                }

                if showingAllCrew == false {
                    Button("Show all") {
                        showingAllCrew.toggle()
                    }
                    .padding()
                }

            }

        }


        .toolbar(content: {
            Button {
                dataController.toggleFavorite(movie)
            } label: {
                if dataController.isFavorite(movie) {
                    Image(systemName: "heart.fill")
                } else {
                    Image(systemName: "heart")
                }
            }
        })
        .navigationTitle(movie.title)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: fetchMovieDetails)
    }
    func fetchMovieDetails(){
        let movieRequest = URLSession.shared.get(path: "movie/\(movie.id)", queryItems: [ : ], defaultValue: nil) {
            downloaded in
            details = downloaded
        }

        let creditsRequest = URLSession.shared.get(path: "movie/\(movie.id)/credits", queryItems: [ : ], defaultValue: nil) {
            downloaded in
            credits = downloaded
        }
        if let movieRequest = movieRequest { requests.insert(movieRequest)}
        if let creditsRequest = creditsRequest { requests.insert(creditsRequest)}
    }
    
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MovieDetailView(movie: Movie.example)
                .environmentObject(DataController(inMemory: true))
        }

    }
}
