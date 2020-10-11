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
    public let toDoDataArray = BehaviorSubject<[ToDoListItem]?>(value: nil)
    
    let goToAddToDoNavigator: GoToAddToDoNavigator
    let toDoDataRepository: ToDoDataRepository

    // MARK: - Methods
    public init(toDoDataRepository:ToDoDataRepository, goToAddToDoNavigator: GoToAddToDoNavigator) {
        self.goToAddToDoNavigator = goToAddToDoNavigator
        self.toDoDataRepository = toDoDataRepository
        
        toDoDataArray.onNext(self.toDoDataRepository.readTodoFromDB()) 
    }
    
    @objc
    public func addToDo() {
        self.goToAddToDoNavigator.navigateAddToDo()
    }
    
    @objc
    public func reloadTableData(){
        toDoDataArray.onNext(self.toDoDataRepository.readTodoFromDB()) 
    }

}
