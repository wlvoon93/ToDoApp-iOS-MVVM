//
//  MainView.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import Foundation

public enum MainView {

    case todoList // show todo list
    case addToDo // to enter a new item to todo list
    case showHistory // to show previously entered to do list item
}

extension MainView: Equatable {

    public static func == (lhs: MainView, rhs: MainView) -> Bool {
        switch (lhs, rhs) {
        case (.todoList, .todoList):
            return true
        case (.addToDo, .addToDo):
            return true
        case (.showHistory, .showHistory):
            return true
        case (.todoList, _),
             (.addToDo, _),
             (.showHistory, _):
            return false
        }
    }
}
