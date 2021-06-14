//
//  DataController.swift
//  FriendFace
//
//  Created by Frederico Kuckelhaus on 12.06.21.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    let container: NSPersistentContainer

    init(inMemory: Bool = false){
        container = NSPersistentContainer(name: "Main")

        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
            container.loadPersistentStores { _, error in
                if let error = error {
                    fatalError("Fatal error loading store \(error.localizedDescription)")
                }
            }
        }

    func save (){
        if container.viewContext.hasChanges {
            try? container.viewContext.save()
        }
    }



    func addToCoreData(_ user: User){

        let savedUser = SavedUser(context: container.viewContext)
        savedUser.id = user.id
        savedUser.name = user.name
        savedUser.company = user.company
        savedUser.email = user.email
        savedUser.about = user.about
        savedUser.isActive = user.isActive
        savedUser.address = user.address
        savedUser.registered = user.registered
        savedUser.age = Int16(user.age)
//        savedUser.friends = String(user.friends)
//            user.friends.map(\.id).joined(separator: ",")
        savedUser.tags = user.tags.joined(separator: ",")

save()

    }
    
}
