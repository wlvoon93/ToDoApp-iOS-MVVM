//
//  AddToDoRootView.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 10/10/2020.
//

import UIKit
import RxSwift
import RxCocoa

class AddToDoRootView: NiblessView {
    // MARK: - Properties
    let viewModel: AddToDoViewModel
    let disposeBag = DisposeBag()
    var hierarchyNotReady = true
    var bottomLayoutConstraint: NSLayoutConstraint?
    
    private var data = [ToDoListItem]()
    
    
//    = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    
    

    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue

        return view
    }()


    // MARK: - Methods
    init(frame: CGRect = .zero,
        viewModel: AddToDoViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)

        bindTextFieldsToViewModel()
        bindViewModelToViews()

    }

    func bindTextFieldsToViewModel() {

    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        guard hierarchyNotReady else {
            return
        }

        constructHierarchy()
        activateConstraints()
        wireController()
        hierarchyNotReady = false

        

    }



    override func layoutSubviews() {
        super.layoutSubviews()

    }

    func constructHierarchy() {
        addSubview(contentView)
    }

    func activateConstraints() {
        activateConstraintsContentView()
    }

    func wireController() {

    }

    func configureViewAfterLayout() {
        //resetScrollViewContentInset()
    }


}

// MARK: - Layout
extension AddToDoRootView {

    func activateConstraintsContentView() {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        let leading = contentView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor)
        let top = contentView.topAnchor
            .constraint(equalTo: safeAreaLayoutGuide.topAnchor)
        let trailing = contentView.trailingAnchor
            .constraint(equalTo: safeAreaLayoutGuide.trailingAnchor)
        let bottom = contentView.bottomAnchor
            .constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)

        NSLayoutConstraint.activate(
            [leading, top, trailing, bottom])

    }

   
}



// MARK: - Dynamic behavior
extension AddToDoRootView {


    func bindViewModelToViews() {

    }



}
