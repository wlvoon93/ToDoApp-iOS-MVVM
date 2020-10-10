//
//  ToDoListViewModel.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import Foundation
import UIKit
import RxSwift

public class ToDoListViewModel{
    // MARK: - Properties
    public let addToDoInput = BehaviorSubject<Bool>(value: false)
    
    let goToAddToDoNavigator: GoToAddToDoNavigator

    // MARK: - Methods
    public init(goToAddToDoNavigator: GoToAddToDoNavigator) {
        self.goToAddToDoNavigator = goToAddToDoNavigator
    }
    
    @objc
    public func addToDo() {
        self.goToAddToDoNavigator.navigateAddToDo()
    }

}
