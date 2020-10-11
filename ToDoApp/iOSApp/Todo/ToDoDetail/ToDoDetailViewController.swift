//
//  ToDoDetailViewController.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 11/10/2020.
//

import Foundation
import RxSwift

public class ToDoDetailViewController: NiblessViewController{
    
    var viewModel: ToDoDetailViewModel
    
    let toDoDetailViewModelFactory: ToDoDetailViewModelFactory
    
    let disposeBag: DisposeBag
    let toDoListItem: ToDoListItem

    
    // MARK: - Methods
    init(viewModelFactory: ToDoDetailViewModelFactory, toDoItem: ToDoListItem) {
        self.toDoDetailViewModelFactory = viewModelFactory
        viewModel = toDoDetailViewModelFactory.makeToDoDetailViewModel(toDoItem: toDoItem)
        disposeBag = DisposeBag()
        self.toDoListItem = toDoItem
        super.init()
        
    }
    
    public override func loadView() {
        self.view = ToDoDetailRootView(viewModel: viewModel, navigationItem: self.navigationItem, toDoItem: self.toDoListItem)
//      self.rootView = self.view as? ToDoListRootView
        
        
    }
    
    public override func viewDidAppear(_ animated: Bool) {

        viewModel.dismissViewControllerInput
        .distinctUntilChanged()
        .subscribe(onNext: {dismissViewControllerInput in
            
            if dismissViewControllerInput == true{
                self.navigationController?.popViewController(animated: true)
            }
        }).disposed(by: disposeBag)
    }
}



protocol ToDoDetailViewModelFactory {

//    func makeJobDetailsViewModel() -> JobDetailsViewModel
    func makeToDoDetailViewModel(toDoItem: ToDoListItem) -> ToDoDetailViewModel
}
