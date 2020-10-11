//
//  ToDoViewModel.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 10/10/2020.
//

import UIKit
import RxSwift

public typealias ToDoNavigationAction = NavigationAction<ToDoView>

public class ToDoViewModel: GoToAddToDoNavigator, GoToToDoDetailNavigator {
    

    // MARK: - Properties
    public var view: Observable<ToDoNavigationAction> { return _view.asObservable() }
    private let _view = BehaviorSubject<ToDoNavigationAction>(value: .present(view: .todoList))

    //.myJobsDateSelection(jobDates: ["2020-07-16T09:11:40.000Z"], workingJobDates: ["2020-07-17T09:11:40.000Z"])

    // MARK: - Methods
    public init() {
    }

    public func uiPresented(myJobsView: ToDoView) {
        _view.onNext(.presented(view: myJobsView))
    }

    public func navigateAddToDo(){
        _view.onNext(.present(view: .addToDo))
    }
    
    public func navigateToDoDetail(toDoListItem: ToDoListItem) {
        _view.onNext(.present(view: .toDoDetail(toDoListItem: toDoListItem)))
    }
    
}
