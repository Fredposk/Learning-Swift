//
//  ProfileHost.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 09.06.21.
//

import SwiftUI

struct ProfileHost: View {

    @State private var draftProfile = Profile.testProfile
    @EnvironmentObject var modelData: ModelData
    @Environment(\.editMode) var editMode

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                EditButton()
            }
            .padding()
        if editMode?.wrappedValue == .inactive {
            ProfileSummary(profile: modelData.profile)
                .padding()
        } else {
            ProfileEditor(profile: $draftProfile)
        }
        }
    }
}

struct ProfileHost_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHost()
            .environmentObject(ModelData())
    }
}
