//
//  ToDoListRootView.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 07/10/2020.
//

import UIKit
import RxSwift
import RxCocoa

class ToDoListRootView: NiblessView {
    // MARK: - Properties
    let viewModel: ToDoListViewModel
    let disposeBag = DisposeBag()
    var hierarchyNotReady = true
    var bottomLayoutConstraint: NSLayoutConstraint?
    
    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue

        return view
    }()

    // MARK: - Methods
    init(frame: CGRect = .zero,
        viewModel: ToDoListViewModel) {
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

//        topRoundedBackgroundView.addBottomRoundedEdge(desiredCurve: 1.5)


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

extension ToDoListRootView {

}

// MARK: - Layout
extension ToDoListRootView {
    
    func activateConstraintsContentView(){
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
extension ToDoListRootView {
    

      func bindViewModelToViews() {

      }

      

}


