//
//  ToDoAppDependencyContainer.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import Foundation

import UIKit

public class TroopersAppDependencyContainer: ToDoListViewModelFactory{
    
    
    
    let sharedMainViewModel: MainViewModel
    let sharedToDoDataRepository: ToDoDataRepository
    
    
    // MARK: - Methods
    public init() {
        
        func makeToDoDataRepository() -> ToDoDataRepository {
          let dataStore = makeToDoDataStore()
          return MyToDoDataRepository()
        }
        
        func makeToDoDataStore() -> ToDoDataStore {
          return FileUserSessionDataStore()
        }
        
        func makeMainViewModel() -> MainViewModel {
          return MainViewModel()
        }
        
        self.sharedMainViewModel = makeMainViewModel()
        self.sharedToDoDataRepository = makeToDoDataRepository()
        
    }
    
    public func makeMainViewController() -> MainViewController {
        let toDoListViewController = makeToDoListViewController()

      return MainViewController(viewModel: sharedMainViewModel,
                                toDoListViewController: toDoListViewController)
    }
    
    func makeToDoListViewController() -> ToDoListViewController {
        return ToDoListViewController(viewModelFactory: self)
    }
    
    func makeToDoListViewModel() -> ToDoListViewModel {
        return ToDoListViewModel()
    }
}
