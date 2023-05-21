//
//  ToDoList2023App.swift
//  ToDoList2023
//
//  Created by Veronica Cheung on 5/20/23.
//

import SwiftUI

@main
struct ToDoList2023App: App {
    let persistenceController = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            //ContentView(toDoItems: .constant([]))
            ContentView().environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
