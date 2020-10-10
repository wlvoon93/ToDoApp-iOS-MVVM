//
//  MainViewController.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import UIKit
import RxSwift

public class MainViewController: NiblessNavigationController {


    // View Model
    let viewModel: MainViewModel

    // Child View Controllers
    let toDoListViewController: ToDoListViewController

    // State
    let disposeBag = DisposeBag()

    // MARK: - Methods
    public init(viewModel: MainViewModel,
        toDoListViewController: ToDoListViewController) {
        self.viewModel = viewModel
        self.toDoListViewController = toDoListViewController

        super.init()
    }

    func subscribe(to observable: Observable<MainView>) {
        observable
            .subscribe(onNext: { [weak self] view in
                guard let strongSelf = self else { return }
                strongSelf.present(view)
            })
            .disposed(by: disposeBag)
    }

    public func present(_ view: MainView) {
        switch view {
        case .todoList:
            presentTodoList()
        case .addToDo:
            presentAddToDo()
        case .showHistory:
            presentShowHistory()
        }
    }

    public func presentTodoList() {
        addFullScreen(childViewController: toDoListViewController)
    }

    public func presentAddToDo(){
        
    }
    
    public func presentShowHistory(){
        
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        observeViewModel()
    }

    private func observeViewModel() {
        let observable = viewModel.view.distinctUntilChanged()
        subscribe(to: observable)
    }
}
