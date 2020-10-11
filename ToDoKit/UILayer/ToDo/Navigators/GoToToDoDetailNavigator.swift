//
//  GoToToDoDetailNavigator.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 11/10/2020.
//

import Foundation

public protocol GoToToDoDetailNavigator {
  
  func navigateToDoDetail(toDoListItem: ToDoListItem)
}
