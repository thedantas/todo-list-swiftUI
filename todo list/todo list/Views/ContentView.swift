//
//  ContentView.swift
//  todo list
//
//  Created by Andre Costa Dantas on 28/09/20.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var taskListViewModel = TaskListViewModel()
    let tasks = testDataTasks
    @State var presentAddNewItem = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                List{
                    ForEach(taskListViewModel.taskCellViewModels) { taskCellViewModels in
                        TaskCell(taskCellViewModels: taskCellViewModels)
                    }
                    if presentAddNewItem {
                        TaskCell(taskCellViewModels: TaskCellViewModel(task: Task(title: "", completed: false))) { task in
                            self.taskListViewModel.addTask(task: task)
                            self.presentAddNewItem.toggle()
                            
                        }
                    }
                }
                Button(action: { self.presentAddNewItem.toggle() }){
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Add New Task")
                    }
                }
                .padding()
            }
            .navigationTitle("Tasks")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}

struct TaskCell: View {
    
    @ObservedObject var taskCellViewModels: TaskCellViewModel
    
    var onCommit: (Task) -> (Void) = {_ in }
    
    var body: some View {
        HStack{
            Image(systemName: taskCellViewModels.task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
                .onTapGesture {
                    self.taskCellViewModels.task.completed.toggle()
                }
            TextField("Enter the task title", text: $taskCellViewModels.task.title, onCommit: {
                self.onCommit(self.taskCellViewModels.task)
            })
        }
    }
}
