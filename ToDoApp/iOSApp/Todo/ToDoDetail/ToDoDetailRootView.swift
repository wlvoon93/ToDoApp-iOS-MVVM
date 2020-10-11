//
//  ToDoDetailRootView.swift
//  ToDoApp
//
//  Created by Voon Wei Liang on 11/10/2020.
//

import UIKit
import RxSwift
import RxCocoa

class ToDoDetailRootView: NiblessView {
    // MARK: - Properties
    let viewModel: ToDoDetailViewModel
    let disposeBag = DisposeBag()
    var hierarchyNotReady = true
    var bottomLayoutConstraint: NSLayoutConstraint?
    let navigationItem: UINavigationItem
    
    let toDoListItem: ToDoListItem
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a MMM dd, yyyy"
        return dateFormatter
    }()
    
    private var data = [ToDoListItem]()
    
    let itemLabel: UILabel = {
        //My Profile
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "the item"
        return label
    }()
    let dateLabel: UILabel = {
        //My Profile
        let label: UILabel = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.text = "the date"
        return label
    }()
    
    
    
    
    func didTapSaveButton(){
        
    }

    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white

        return view
    }()


    // MARK: - Methods
    init(frame: CGRect = .zero,
         viewModel: ToDoDetailViewModel, navigationItem: UINavigationItem, toDoItem:ToDoListItem) {
        self.viewModel = viewModel
        self.navigationItem = navigationItem
        self.toDoListItem = toDoItem
        super.init(frame: frame)
        

        bindTextFieldsToViewModel()
        bindViewModelToViews()
        
//
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
        
        self.itemLabel.text = self.toDoListItem.item
        
        self.dateLabel.text = ToDoDetailRootView.dateFormatter.string(from: self.toDoListItem.date)
    }



    override func layoutSubviews() {
        super.layoutSubviews()

    }

    func constructHierarchy() {
        addSubview(contentView)
        contentView.addSubview(itemLabel)
        contentView.addSubview(dateLabel)
        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: viewModel, action: #selector(ToDoDetailViewModel.removeToDo))
        self.navigationItem.setRightBarButtonItems([barButtonItem], animated: true)
    }

    func activateConstraints() {
        activateConstraintsContentView()
        activateConstraintsItemLabel()
        activateConstraintsDateLabel()
    }

    func wireController() {
       
    }

    func configureViewAfterLayout() {
        //resetScrollViewContentInset()
    }


}

// MARK: - Layout
extension ToDoDetailRootView {

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
    
    func activateConstraintsItemLabel(){
        itemLabel.translatesAutoresizingMaskIntoConstraints = false
        let leading = itemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20)
        let trailing = itemLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        let top = itemLabel.topAnchor
            .constraint(equalTo: contentView.topAnchor, constant: 10)


        NSLayoutConstraint.activate(
            [leading, top, trailing])
    }
    
    func activateConstraintsDateLabel(){
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        let leading = dateLabel.leadingAnchor.constraint(equalTo: itemLabel.leadingAnchor)
        let trailing = dateLabel.trailingAnchor.constraint(equalTo: itemLabel.trailingAnchor)
        let top = dateLabel.topAnchor
            .constraint(equalTo: itemLabel.bottomAnchor, constant: 10)

        NSLayoutConstraint.activate(
            [leading, top, trailing])
    }

}



// MARK: - Dynamic behavior
extension ToDoDetailRootView {


    func bindViewModelToViews() {

    }



}

extension ToDoDetailRootView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}


