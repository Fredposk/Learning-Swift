//
//  TaskListViewModel.swift
//  To-do-List
//
//  Created by Frederico Kuckelhaus on 13.04.21.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskCellViewModel = [TaskCellViewModel]()
    private var cancellable = Set<AnyCancellable>()
    
    
    init() {
        self.taskCellViewModel = testDataTasks.map {
            task in TaskCellViewModel(task: task)
        }
    }
    func addTask(task: Task){
        let taskVM = TaskCellViewModel(task: task)
        taskCellViewModel.append(taskVM)
    }
    
    func deleteTask(index: String){
        print("\(index)")
    }
    
}
