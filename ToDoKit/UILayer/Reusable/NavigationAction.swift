//
//  NavigationAction.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 10/10/2020.
//

import Foundation

public enum NavigationAction<ViewModelType>: Equatable where ViewModelType: Equatable {

  case present(view: ViewModelType)
    case dismiss(view: ViewModelType)
  case presented(view: ViewModelType)
}
