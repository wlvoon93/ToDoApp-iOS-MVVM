//
//  ToDoDataRepository.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import Foundation

public protocol ToDoDataRepository {

    func readTodoFromDB() -> [ToDoListItem]
    func writeToDoToDB(date: Date, item: String)
    func removeToDo(item:ToDoListItem?)
}
