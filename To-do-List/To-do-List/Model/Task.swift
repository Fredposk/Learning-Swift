//
//  Task.swift
//  To-do-List
//
//  Created by Frederico Kuckelhaus on 13.04.21.
//

import Foundation

struct Task: Identifiable {
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
}


#if DEBUG
let testDataTasks = [
    Task(title: "Implement UI", completed: true),
    Task(title: "Connect to Firebase", completed: false),
    Task(title: "????", completed: false),
    Task(title: "Profit!!", completed: false)
]
#endif
