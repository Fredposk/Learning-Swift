//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Frederico Kuckelhaus on 11.06.21.
//

import SwiftUI

@main
struct FriendFaceApp: App {

@StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }

    }
}
