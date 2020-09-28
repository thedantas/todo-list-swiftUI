//
//  ContentView.swift
//  todo list
//
//  Created by Andre Costa Dantas on 28/09/20.
//

import SwiftUI

struct ContentView: View {
    
    let tasks = testDataTasks
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                List(tasks) { task in
                    TaskCell(task: task)
                }
                Button(action: {}){
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
    let task: Task
    var body: some View {
        HStack{
            Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                .resizable()
                .frame(width: 20, height: 20)
            Text(task.title)
        }
    }
}
