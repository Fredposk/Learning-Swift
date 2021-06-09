//
//  ProfileSummary.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 09.06.21.
//

import SwiftUI

struct ProfileSummary: View {
    @EnvironmentObject var modelData: ModelData
    var profile: Profile
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.userName)
                    .font(.title.bold())

                Text("Notifications: \(profile.prefersNotifications ? "ON" : "OFF")")
                Text("Seasonal Photos: \(profile.seasonalPhoto.rawValue)")
                Text("Goal Date: \(profile.goalDate, style: .date)")
                Divider()
                VStack(alignment: .leading) {
                        Text("Completed Badges")
                            .font(.title)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            HikeBadge(name: "FirstHike")
                                .hueRotation(Angle(degrees: 90))
                            HikeBadge(name: "10 Hikes")
                                .hueRotation(Angle(degrees: 200))
                            HikeBadge(name: "20 Hikes")
                        }

                    }
                }
                Divider()

                VStack(alignment: .leading) {
                    Text("Recent Hikes")
                        .font(.headline)

                    HikeView(hike: modelData.hikes[0])
                }

            }
        }
        .padding()
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.testProfile)
            .environmentObject(ModelData())
    }
}
