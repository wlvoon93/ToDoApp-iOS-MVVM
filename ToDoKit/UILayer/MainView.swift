//
//  MainView.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import Foundation

public enum MainView {

  case todoList
}

extension MainView: Equatable {
  
  public static func ==(lhs: MainView, rhs: MainView) -> Bool {
    switch (lhs, rhs) {
    case (.todoList, .todoList):
      return true
    case (.todoList, _):
      return false
    }
  }
}
