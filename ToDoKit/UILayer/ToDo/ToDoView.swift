//
//  ToDoView.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 10/10/2020.
//

import Foundation

public enum ToDoView {

    case todoList // show todo list
    case addToDo // to enter a new item to todo list
    case toDoDetail(toDoListItem: ToDoListItem) // to show ToDo detail

    public func hidesNavigationBar() -> Bool {
        switch self {
        case .todoList:
            return false
        case .addToDo:
            return false
        case .toDoDetail:
            return false
        }
    }

}

extension ToDoView: Equatable {

    public static func == (lhs: ToDoView, rhs: ToDoView) -> Bool {
        switch (lhs, rhs) {
        case (.todoList, .todoList):
            return true
        case (.addToDo, .addToDo):
            return true
        case (.toDoDetail, .toDoDetail):
            return true
        case (.todoList, _),
             (.addToDo, _),
             (.toDoDetail, _):
            return false
        }
    }
}
