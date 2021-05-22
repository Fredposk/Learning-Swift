//
//  studyCardApp.swift
//  studyCard
//
//  Created by Frederico Kuckelhaus on 21.05.21.
//

import SwiftUI
import Firebase

@main
struct studyCardApp: App {

    init(){
        FirebaseApp.configure()
    }


    var body: some Scene {
        WindowGroup {
            CardListView(cardListViewModel: CardListViewModel())
        }
    }
}
