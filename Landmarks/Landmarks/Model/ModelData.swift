//
//  ModelData.swift
//  Landmarks
//
//  Created by Frederico Kuckelhaus on 07.06.21.
//

import Foundation


class ModelData: ObservableObject {
  @Published  var landmarks: [Landmark] = Bundle.main.decode([Landmark].self, from: "landmarkData.json")

}
