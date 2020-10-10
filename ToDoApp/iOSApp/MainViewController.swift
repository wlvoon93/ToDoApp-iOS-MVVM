//
//  MainViewController.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import UIKit
import RxSwift

public class MainViewController: NiblessViewController {

    // MARK: - Properties
    // View Model
    let viewModel: MainViewModel

    // Child View Controllers
    let toDoViewController: ToDoViewController

    // State
    let disposeBag = DisposeBag()

    // MARK: - Methods
    init(viewModel: MainViewModel,
        toDoViewController: ToDoViewController) {
        self.viewModel = viewModel

        self.toDoViewController = toDoViewController



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
        case .toDo:
            presentToDo()
        }
    }

   

    func presentToDo() {

        addFullScreen(childViewController: self.toDoViewController)
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
