//
//  WorldView.swift
//  Trekr
//
//  Created by Frederico Kuckelhaus on 09.04.21.
//

import MapKit
import SwiftUI


struct WorldView: View {
    @EnvironmentObject var location: Locations
    @State  var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.07222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 40, longitudeDelta: 40))
    var body: some View {
        Map(coordinateRegion: $region, annotationItems: location.places) { location in
            MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)) {
                NavigationLink(destination: ContentView(location: location)) {
                    Image(location.country)
                        .resizable()
                        .cornerRadius(10)
                        .frame(width: 80, height: 40)
                        .shadow(radius: 3)
                }}
        }
    }
}

struct WorldView_Previews: PreviewProvider {
    static var previews: some View {
        WorldView()
    }
}
