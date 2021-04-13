//
//  TaskCellViewModel.swift
//  To-do-List
//
//  Created by Frederico Kuckelhaus on 13.04.21.
//

import Foundation
import Combine
class TaskCellViewModel: ObservableObject, Identifiable {
    var id = ""
    @Published var task: Task
    @Published var completionStateIconName = ""
    
    private var cancellable = Set<AnyCancellable>()
    
    init(task: Task) {
        self.task = task
        $task
            .map {
                task in task.completed ? "checkmark.circle.fill" : "circle"
            }
            .assign(to: \.completionStateIconName, on: self)
            .store(in: &cancellable)
        $task
            .map {
                task in task.id
            }
            .assign(to: \.id, on: self)
            .store(in: &cancellable)
            
    }
    
}
