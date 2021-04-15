//
//  ContentView.swift
//  To-do-List
//
//  Created by Frederico Kuckelhaus on 13.04.21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskListVM = TaskListViewModel()
    @State var presentAddNewItem = false
//    @State var testingState: String = "Data"
    var body: some View {
        VStack(alignment: .leading) {
            NavigationView {
                ScrollView {
                    ForEach(taskListVM.taskCellViewModel) { item in
                        TaskCell(TaskCellVM: item)
                    }
//                     MARK: - This is probably wrong place
//                    .onDelete(perform: { indexSet in
//                        for index in indexSet {
//                            taskListVM.taskCellViewModel.remove(at: index)
//                        }
//                    })
                    if (presentAddNewItem){
                        TaskCell(TaskCellVM: TaskCellViewModel(task: Task(title: "", completed: false))) {
                            task in self.taskListVM.addTask(task: task)
                            self.presentAddNewItem.toggle()
                        }
                    }
                } .navigationBarTitle("Tasks")
                
            }
           

            Button(action: {
                presentAddNewItem.toggle()
            }) {
                Spacer()
                HStack {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .aspectRatio( contentMode: .fit)
                        .padding(.leading)
                    Text("Add new Task")
                }.foregroundColor(.secondary)
                Spacer()
            }
        }
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TaskCell: View {
    @ObservedObject var TaskCellVM: TaskCellViewModel
    var onCommit: (Task) -> (Void) = {_ in}
    var body: some View {
        HStack {
            Image(systemName: TaskCellVM.completionStateIconName)
                .resizable()
                .frame(width: 20, height: 20)
                .aspectRatio( contentMode: .fit)
                .padding()
                .onTapGesture {
                    TaskCellVM.task.completed.toggle()
                }
            
            TextField("Add New Task", text: $TaskCellVM.task.title, onCommit:{
                self.onCommit(self.TaskCellVM.task)
            })
        }
    }
}
