//
//  AddToDoViewController.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 10/10/2020.
//

import Foundation
import RxSwift

public class AddToDoViewController: NiblessViewController{
    
    var viewModel: AddToDoViewModel
    
    let addToDoViewModelFactory: AddToDoViewModelFactory
    
    let disposeBag: DisposeBag

    
    // MARK: - Methods
    init(viewModelFactory: AddToDoViewModelFactory) {
        self.addToDoViewModelFactory = viewModelFactory
        viewModel = addToDoViewModelFactory.makeAddToDoViewModel()
        disposeBag = DisposeBag()
        super.init()
        
    }
    
    public override func loadView() {
      self.view = AddToDoRootView(viewModel: viewModel, navigationItem: self.navigationItem)
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
        
        viewModel.inputError.distinctUntilChanged()
            .subscribe(onNext: {inputError in
                
                if inputError.count > 0{
                    let alert = UIAlertController(title: "Error", message: inputError, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            }).disposed(by: disposeBag)
    }
}



protocol AddToDoViewModelFactory {

//    func makeJobDetailsViewModel() -> JobDetailsViewModel
    func makeAddToDoViewModel() -> AddToDoViewModel
}
