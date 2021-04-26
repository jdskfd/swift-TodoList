//
//  ContentView.swift
//  TodoList
//
//  Created by JoHsun Chao on 2021/3/17.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var taskStore = TaskStore()
    @State var newTodo : String = ""
    
    func addNewTodo (){
        taskStore.tasks.append(Task(id: String(taskStore.tasks.count+1), todoItem: newTodo))
        self.newTodo = ""
    }
    
    func move(from source: IndexSet, to destination: Int) {
        taskStore.tasks.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets : IndexSet){
        taskStore.tasks.remove(atOffsets: offsets)
    }
    
    var searchBar: some View {
        HStack {
            TextField("Enter a new Task", text: self.$newTodo)
            Button(action: self.addNewTodo, label: {
                Text("Add New Todo")
            })
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(self.taskStore.tasks){
                        task in
                        Text(task.todoItem)
                    }.onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                }.navigationBarTitle("Tasks")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
