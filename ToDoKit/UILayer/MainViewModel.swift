//
//  MainViewModel.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import Foundation
import RxSwift

public class MainViewModel{
    
    // MARK: - Properties
    public var view: Observable<MainView> { return viewSubject.asObservable() }
    private let viewSubject = BehaviorSubject<MainView>(value: .toDo)

    // MARK: - Methods
    public init() { }

    
}
