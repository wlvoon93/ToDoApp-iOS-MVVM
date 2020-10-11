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
    let navigationItem: UINavigationItem
    
    private var data = [ToDoListItem]()
    
    let toDoTextField: UITextField = {

        let field = StyledTextField()
        field.placeholder = "ToDo eg. Take a bath!"

        return field
    }()
    
    let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.timeZone = NSTimeZone.local
        picker.backgroundColor = UIColor.white
        picker.datePickerMode = .dateAndTime
        
        return picker
    }()

    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white

        return view
    }()
    
    let submitButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.clipsToBounds = true
        return button

    }()


    // MARK: - Methods
    init(frame: CGRect = .zero,
         viewModel: AddToDoViewModel, navigationItem: UINavigationItem) {
        self.viewModel = viewModel
        self.navigationItem = navigationItem
        super.init(frame: frame)

        bindTextFieldsToViewModel()

        toDoTextField.becomeFirstResponder()
        toDoTextField.delegate = self
    }

    func bindTextFieldsToViewModel() {
        bindToDoTextField()
    }
    
    func bindToDoTextField(){
        toDoTextField.rx.text
        .asDriver()
        .map { $0 ?? "" }
        .drive(viewModel.toDoTextInput)
        .disposed(by: disposeBag)

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
        contentView.addSubview(toDoTextField)
        contentView.addSubview(datePicker)
        
        let barButtonItem = UIBarButtonItem(customView: submitButton)
        self.navigationItem.setRightBarButtonItems([barButtonItem], animated: true)
    }

    func activateConstraints() {
        activateConstraintsContentView()
        activateConstraintsToDoTextField()
        activateConstraintsDatePicker()
    }

    func wireController() {
        datePicker.addTarget(viewModel, action: #selector(AddToDoViewModel.dateChanged(picker:)), for: .valueChanged)
        submitButton.addTarget(viewModel, action: #selector(AddToDoViewModel.addToDoData), for: .touchUpInside)
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

    func activateConstraintsToDoTextField(){
        toDoTextField.translatesAutoresizingMaskIntoConstraints = false
        let leading = toDoTextField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10)
        let top = toDoTextField.topAnchor
            .constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10)
        let trailing = toDoTextField.trailingAnchor
            .constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
        let height = toDoTextField.heightAnchor
            .constraint(equalToConstant: 50)

        NSLayoutConstraint.activate(
            [leading, top, trailing, height])
    }
    
    func activateConstraintsDatePicker(){
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        let leading = datePicker.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10)
        let top = datePicker.topAnchor
            .constraint(equalTo: toDoTextField.bottomAnchor, constant: 10)
        let trailing = datePicker.trailingAnchor
            .constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10)
//        let height = datePicker.heightAnchor
//            .constraint(equalToConstant: 300)

        NSLayoutConstraint.activate(
            [leading, top, trailing])
    }
}

// text field delegate
extension AddToDoRootView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

class StyledTextField: UITextField {
    let insetConstant = UIEdgeInsets(top: 4, left: 10, bottom: 4, right: 10)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insetConstant)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insetConstant)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: insetConstant)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor(white: 2/3, alpha: 0.5).cgColor
        self.layer.borderWidth = 1
        self.clearButtonMode = .whileEditing
        self.keyboardType = UIKeyboardType.decimalPad
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
