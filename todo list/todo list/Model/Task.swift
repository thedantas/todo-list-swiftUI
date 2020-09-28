//
//  Task.swift
//  todo list
//
//  Created by Andre Costa Dantas on 28/09/20.
//

import Foundation

struct Task: Identifiable {
    
    var id: String = UUID().uuidString
    var title: String
    var completed: Bool
    
}

#if DEBUG
let testDataTasks = [
Task(title: "Primeira Task", completed: true),
Task(title: "Segunda Task", completed: false)
]
#endif
