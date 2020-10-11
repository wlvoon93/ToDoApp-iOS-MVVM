//
//  ToDoAppDependencyContainer.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import UIKit
import RxSwift

public class ToDoAppDependencyContainer {

    // Long-lived dependencies
    let sharedMainViewModel: MainViewModel
    let sharedToDoDataRepository: ToDoDataRepository

    // MARK: - Methods
    public init() {
        
        func makeToDoDataRepository() -> ToDoDataRepository {
          let dataStore = makeToDoDataStore()
          return MyToDoDataRepository(dataStore: dataStore)
        }
        
        func makeToDoDataStore() -> ToDoDataStore {
          return MyToDoDataStore()
        }

        func makeMainViewModel() -> MainViewModel {
            return MainViewModel()
        }

        self.sharedMainViewModel = makeMainViewModel()
        self.sharedToDoDataRepository = makeToDoDataRepository()
    }

    // Main
    // Factories needed to create a MainViewController.

    public func makeMainViewController() -> MainViewController {
        let toDoViewController = makeToDoViewController()

        return MainViewController(viewModel: sharedMainViewModel,
            toDoViewController: toDoViewController)
    }

    // Tabs
    // Factories needed to create an TabsViewController.

    func makeToDoViewController() -> ToDoViewController {
        let dependencyContainer = ToDoDependencyContainer(appDependencyContainer: self)
        return dependencyContainer.makeToDoViewController()
    }


}

extension ToDoAppDependencyContainer { }
