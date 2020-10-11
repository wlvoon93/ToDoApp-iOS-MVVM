//
//  ToDoViewController.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 10/10/2020.
//

import UIKit
import RxSwift

class ToDoViewController: NiblessNavigationController {

    // MARK: - Properties
    // View Model
    let viewModel: ToDoViewModel
    let disposeBag = DisposeBag()

    // Child View Controllers
    let toDoListViewController: ToDoListViewController
//    let addToDoViewController: AddToDoViewController

    //factories
    let makeAddToDoViewController: () -> AddToDoViewController


    var loggedInAtInit: Bool = false

    // MARK: - Methods
    init(viewModel: ToDoViewModel,
         toDoListViewController: ToDoListViewController,
         addToDoViewControllerFactory: @escaping () -> AddToDoViewController) {
        
        self.viewModel = viewModel
        self.toDoListViewController = toDoListViewController
        self.makeAddToDoViewController = addToDoViewControllerFactory

        super.init()

        self.delegate = self
        loadUserSession()
    }
    
    private func loadUserSession(){
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        subscribe(to: viewModel.view)
        
    }

    func subscribe(to observable: Observable<ToDoNavigationAction>) {
        observable
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] action in
                guard let strongSelf = self else { return }
                strongSelf.respond(to: action)
            }).disposed(by: disposeBag)
    }

    func respond(to navigationAction: ToDoNavigationAction) {
        switch navigationAction {
        case .present(let view):
            present(view: view)
        case .dismiss(let view):
            print("dismiss")
            //            dismiss(view: view)
        case .presented:
            break
        }
    }

    func present(view: ToDoView) {
        switch view {
        case .todoList:
            print("to do list")
            presentToDoList()
        case .addToDo:
            print("add to do")
            presentAddToDo()
        case .showHistory:
            print("show history")

        }
    }
    
    func presentToDoList(){
        let navBarAppearance = UINavigationBarAppearance()
            navBarAppearance.configureWithOpaqueBackground()
            navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor.black
        self.navigationBar.standardAppearance = navBarAppearance
        self.navigationBar.scrollEdgeAppearance = navBarAppearance
        self.navigationBar.prefersLargeTitles = true
        toDoListViewController.title = "ToDo List"
        
        self.pushViewController(toDoListViewController, animated: true)
    }

    func presentAddToDo(){
        let viewController = makeAddToDoViewController()
        viewController.title = "Add ToDo"
        self.pushViewController(viewController, animated: true)
    }

    
}
// MARK: - Navigation Bar Presentation
extension ToDoViewController {

    func hideOrShowNavigationBarIfNeeded(for view: ToDoView, animated: Bool) {
        if view.hidesNavigationBar() {
            hideNavigationBar(animated: animated)
        } else {
            showNavigationBar(animated: animated)
        }
    }

    func hideNavigationBar(animated: Bool) {
        if animated {
            transitionCoordinator?.animate(alongsideTransition: { context in
                self.setNavigationBarHidden(true, animated: animated)
            })
        } else {
            setNavigationBarHidden(true, animated: false)
        }
    }

    func showNavigationBar(animated: Bool) {
        if self.isNavigationBarHidden {
            self.setNavigationBarHidden(false, animated: animated)
        }
    }
}

// MARK: - UINavigationControllerDelegate
extension ToDoViewController: UINavigationControllerDelegate {

    public func navigationController(_ navigationController: UINavigationController,
        willShow viewController: UIViewController,
        animated: Bool) {
        guard let viewToBeShown = ToDoView(associatedWith: viewController) else { return }
        hideOrShowNavigationBarIfNeeded(for: viewToBeShown, animated: animated)
    }

    public func navigationController(_ navigationController: UINavigationController,
        didShow viewController: UIViewController,
        animated: Bool) {
        guard let shownView = ToDoView(associatedWith: viewController) else { return }
        viewModel.uiPresented(myJobsView: shownView)
    }

    public override func popViewController(animated: Bool) -> UIViewController? {
        super.popViewController(animated: animated)

        return self
    }
}


extension ToDoViewController {

    func ToDoView(associatedWith viewController: UIViewController) -> ToDoView? {
        switch viewController {
        case is ToDoListViewController:
            return .todoList
        case is AddToDoViewController:
            return .addToDo

        default:
            assertionFailure("Encountered unexpected child view controller type in DiscoverJobsViewController")
            return nil
        }
    }
}

protocol ToDoViewModelFactory {

    func makeToDoViewModel() -> ToDoViewModel
}
