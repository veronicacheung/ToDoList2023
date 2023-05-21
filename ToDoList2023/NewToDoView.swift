//
//  NewToDoView.swift
//  ToDoList2023
//
//  Created by Veronica Cheung on 5/20/23.
//

import SwiftUI

struct NewToDoView: View {
    @Environment(\.managedObjectContext) var context
    @State var title: String
    @State var isImportant: Bool
    @Binding var showNewTask : Bool
    
    var body: some View {
            VStack {
                Text("Add a new task")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.vertical)
                TextField("Name of Task", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Toggle(isOn: $isImportant) {
                    Text("Is it important?")
                        .padding(.horizontal)
                        .fontWeight(.bold)
                }.padding()
                
                Button(action: {
                    self.addTask(title: self.title, isImportant: self.isImportant)
                    self.showNewTask = false
                }) {
                    Text("Add")
                        .padding()
                        .font(.system(size: 20))
                }
            }
    }
    private func addTask(title: String, isImportant: Bool = false) {
        
        let task = ToDo(context: context)
        task.id = UUID()
        task.title = title
        task.isImportant = isImportant
        
        do {
            try context.save()
        } catch {
            print(error)
        }
    }
}

struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(title: "", isImportant: false, showNewTask: .constant(true))
    }
}
