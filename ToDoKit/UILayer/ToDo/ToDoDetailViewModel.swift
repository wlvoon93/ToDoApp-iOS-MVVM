//
//  ToDoDetailViewModel.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 11/10/2020.
//

import Foundation
import UIKit
import RxSwift

public class ToDoDetailViewModel{
    // MARK: - Properties
    let toDoDataRepository: ToDoDataRepository
    
    let toDoTextInput = BehaviorSubject<String>(value: "")
    let dateInput = BehaviorSubject<Date>(value: Date.init(timeIntervalSinceNow: 0))
    
    let inputError = BehaviorSubject<String>(value: "")
    let dismissViewControllerInput = BehaviorSubject<Bool>(value: false)
    let toDoItem = BehaviorSubject<ToDoListItem?>(value: nil)
    
    let dismissViewController = BehaviorSubject<Bool>(value: false)

    // MARK: - Methods
    public init(toDoDataRepository:ToDoDataRepository,
                toDoItem: ToDoListItem) {
        self.toDoDataRepository = toDoDataRepository
        self.toDoItem.onNext(toDoItem)
    }
    
    @objc
    public func removeToDo() {
        let (toDoItem) = getToDoItem()
        self.toDoDataRepository.removeToDo(item: toDoItem)
    
        self.dismissViewControllerInput.onNext(true)
    }
    
    func getToDoItem() -> (ToDoListItem) {
        do {
            let aToDoItem = try toDoItem.value()
  
            return (aToDoItem!)
        } catch {
            fatalError("error reading to do item")
        }
    }
}
