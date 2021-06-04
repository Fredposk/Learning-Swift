//
//  BookWormApp.swift
//  BookWorm
//
//  Created by Frederico Kuckelhaus on 04.06.21.
//

import SwiftUI

@main
struct BookWormApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
