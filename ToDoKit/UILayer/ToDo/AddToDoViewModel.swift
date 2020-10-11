//
//  AddToDoViewModel.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 10/10/2020.
//

import Foundation
import UIKit
import RxSwift

public class AddToDoViewModel{
    // MARK: - Properties
    let toDoDataRepository: ToDoDataRepository
    
    let toDoTextInput = BehaviorSubject<String>(value: "")
    let dateInput = BehaviorSubject<Date>(value: Date.init(timeIntervalSinceNow: 0))
    
    let inputError = BehaviorSubject<String>(value: "")
    let dismissViewControllerInput = BehaviorSubject<Bool>(value: false)

    // MARK: - Methods
    public init(toDoDataRepository:ToDoDataRepository) {
        
        self.toDoDataRepository = toDoDataRepository
    }
    
    @objc
    public func addToDoData() {
        let (toDoText, date) = getFormInput()
        
        if toDoText.count < 1 {
            inputError.onNext("Please input ToDo.")
        }else{
            self.toDoDataRepository.writeToDoToDB(date: date, item: toDoText)
            self.dismissViewControllerInput.onNext(true)
        }
    }
    
    @objc
    public func dateChanged(picker: UIDatePicker){
        dateInput.onNext(picker.date) 
    }
    
    func getFormInput() -> (String, Date) {
        do {
            let toDoText = try toDoTextInput.value()
            let date = try dateInput.value()

            return (toDoText, date)
        } catch {
            fatalError("Error reading text or date")
        }
    }

}
