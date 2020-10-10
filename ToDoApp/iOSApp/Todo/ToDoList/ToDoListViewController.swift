//
//  ToDoListViewController.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import Foundation
import RxSwift

public class ToDoListViewController: NiblessViewController{
    
    var viewModel: ToDoListViewModel
    
    let toDoListViewModelFactory: ToDoListViewModelFactory
    
    let disposeBag: DisposeBag

    
    // MARK: - Methods
    init(viewModelFactory: ToDoListViewModelFactory) {
        self.toDoListViewModelFactory = viewModelFactory
        viewModel = toDoListViewModelFactory.makeToDoListViewModel()
        disposeBag = DisposeBag()
        super.init()
        
    }
    
    public override func loadView() {
      self.view = ToDoListRootView(viewModel: viewModel)
//      self.rootView = self.view as? ToDoListRootView
        
        
    }
    
    public override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.parent?.navigationItem.title = "sdfsdf."

    }
}



protocol ToDoListViewModelFactory {

//    func makeJobDetailsViewModel() -> JobDetailsViewModel
    func makeToDoListViewModel() -> ToDoListViewModel
}
