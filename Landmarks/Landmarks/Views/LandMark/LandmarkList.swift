//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 07.06.21.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFavoritesOnly = false
    @EnvironmentObject var modelData: ModelData

    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            landmark.isFavorite || !showFavoritesOnly
        }
    }

    var body: some View {

        NavigationView {
            List {
                Toggle("Show Favourites", isOn: $showFavoritesOnly)
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink(
                        destination: LandmarkDetailView(landmark: landmark),
                        label: {
                            LandmarkRow(landmark: landmark)
                        })
                }
            }
            .navigationTitle(Text("LandMarks"))
        }

    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
}
