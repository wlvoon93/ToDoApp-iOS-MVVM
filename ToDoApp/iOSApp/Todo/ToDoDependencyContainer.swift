//
//  ToDoDependencyContainer.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 10/10/2020.
//

import UIKit

public class ToDoDependencyContainer {

    // MARK: - Properties
    
    // From parent container
      let sharedMainViewModel: MainViewModel

      // Long-lived dependencies
      let sharedToDoViewModel: ToDoViewModel

      // MARK: - Methods
      init(appDependencyContainer: ToDoAppDependencyContainer) {
        func makeToDoViewModel() -> ToDoViewModel{
          return ToDoViewModel()
        }
        
        self.sharedMainViewModel = appDependencyContainer.sharedMainViewModel

        self.sharedToDoViewModel = ToDoViewModel()
      }

      // ToDo
      func makeToDoViewController() -> ToDoViewController {
        let toDoListViewController = makeToDoListViewController()
        let addToDoViewController = makeAddToDoViewController()
        
        return ToDoViewController(viewModel: sharedToDoViewModel,
                                  toDoListViewController: toDoListViewController,
                                  addToDoViewController: addToDoViewController)
      }
    
    // to do list
    public func makeToDoListViewController() ->
    ToDoListViewController {
        return ToDoListViewController(viewModelFactory: self)
    }

    func makeToDoListViewModel() -> ToDoListViewModel {
        return ToDoListViewModel(goToAddToDoNavigator: self.sharedToDoViewModel)
    }
    
    
      // add to do
    public func makeAddToDoViewController() ->
    AddToDoViewController {
        return AddToDoViewController(viewModelFactory: self)
    }

    func makeAddToDoViewModel() -> AddToDoViewModel {
        return AddToDoViewModel()
    }
}

extension ToDoDependencyContainer: ToDoListViewModelFactory, AddToDoViewModelFactory {
    
}
