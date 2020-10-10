//
//  MainView.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import Foundation

public enum MainView {

  case toDo
}

extension MainView: Equatable {
  
  public static func ==(lhs: MainView, rhs: MainView) -> Bool {
    switch (lhs, rhs) {
    case (.toDo, .toDo):
      return true
    case (.toDo, _):
      return false
    }
  }
}



