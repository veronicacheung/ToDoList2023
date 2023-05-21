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
        ZStack {
            Color(.white)
                .ignoresSafeArea()
            VStack {
                Text("ADD A NEW TASK")
                    .font(.system(size: 40))
                    .fontWeight(.black)
                
                TextField("Enter the task description", text: $title)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Toggle(isOn: $isImportant) {
                    Text("Is it important?")
                        .font(.system(size: 20))
                        .fontWeight(.black)
                }.padding()
                    .shadow(radius: 10)
                    .tint(.gray)
                
                Button(action: {
                    self.addTask(title: self.title, isImportant: self.isImportant)
                    self.showNewTask = false
                }) {
                    Text("Add")
                        .padding()
                        .background(.white)
                        .font(.system(size: 15))
                        .fontWeight(.black)
                }
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
