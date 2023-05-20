//
//  ToDoItem.swift
//  ToDoList2023
//
//  Created by Veronica Cheung on 5/20/23.
//

import Foundation

class ToDo {
    var title = ""
    var isImportant = false
    
    init(title: String, isImportant: Bool = false) {
            self.title = title
            self.isImportant = isImportant
        }

}
