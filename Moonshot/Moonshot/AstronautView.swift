//
//  AstronautView.swift
//  Moonshot
//
//  Created by Frederico Kuckelhaus on 03.05.21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
//    let mission: [Mission]

    struct missionsParticipated {
        let missionName: String
        let missionImage: String
    }

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)

                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)
                    HStack {


                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
//    init(astronaut: Astronaut, mission: [Mission]){
//        self.astronaut = astronaut
//        var matches = [missionsParticipated]()
//        for item in mission {
//            if let match = mission.first(where: { astronaut.id == item. }){
//                matches.append(missionsParticipated(missionName: match.displayName, missionImage: match.image))
//            }
//        }
//    }
    
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0])
    }
}
