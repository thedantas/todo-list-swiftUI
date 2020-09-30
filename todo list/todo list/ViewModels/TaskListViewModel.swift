//
//  TaskListViewModel.swift
//  todo list
//
//  Created by Andre Costa Dantas on 30/09/20.
//

import Foundation
import Combine

class TaskListViewModel: ObservableObject {
    @Published var taskCellViewModels = [TaskCellViewModel]()
    
    private var cancellable = Set<AnyCancellable>()
    
    init(){
        self.taskCellViewModels = testDataTasks.map{ task in
            TaskCellViewModel(task: task)
        }
    }
    func addTask(task: Task){
        let taskViewModel  = TaskCellViewModel(task: task)
        self.taskCellViewModels.append(taskViewModel)
    }
}
