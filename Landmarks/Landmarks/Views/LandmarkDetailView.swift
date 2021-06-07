//
//  LandmarkDetailView.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 07.06.21.
//

import SwiftUI

struct LandmarkDetailView: View {

    @EnvironmentObject var modelData: ModelData
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex { $0.id == landmark.id}!
    }

    var landmark: Landmark

    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            CircleImage(image: landmark.image)
                .offset(y: -130)
                .padding(.bottom, -130)
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    Spacer()
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                Divider()
                VStack( alignment: .leading) {
                    Text("About \(landmark.name)")
                        .font(.title2)
                    Text(landmark.description)
                        .padding(.top)
                }

            }
            .padding(.top, -30)
            .padding(.horizontal)
            .navigationTitle(Text(landmark.name))
            .navigationBarTitleDisplayMode(.inline)
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct LandmarkDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetailView(landmark: ModelData().landmarks[0])
            .environmentObject(ModelData())
    }
}
