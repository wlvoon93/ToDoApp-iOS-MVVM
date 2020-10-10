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
    
    private var data = [ToDoListItem]()
    
    
//    = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    
    let addButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        
        button.clipsToBounds = true
//        button.layer.cornerRadius = 15
        return button
    }()

    let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.blue

        return view
    }()
    
    let barView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.gray

        return view
    }()

    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        return table
    }()

    // MARK: - Methods
    init(frame: CGRect = .zero,
        viewModel: ToDoListViewModel) {
        self.viewModel = viewModel
        super.init(frame: frame)

        bindTextFieldsToViewModel()
        bindViewModelToViews()

        tableView.delegate = self
        tableView.dataSource = self
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
        contentView.addSubview(tableView)
        barView.addSubview(addButton)
        contentView.addSubview(barView)
    }

    func activateConstraints() {
        activateConstraintsContentView()
        activateConstraintsTableView()
        activateConstraintsAddButton()
        activateConstraintsBarView()
    }

    func wireController() {
        addButton.addTarget(viewModel,
                             action: #selector(ToDoListViewModel.addToDo),
                             for: .touchUpInside)
    }

    func configureViewAfterLayout() {
        //resetScrollViewContentInset()
    }


}

// MARK: - Layout
extension ToDoListRootView {

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

    func activateConstraintsTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let leading = tableView.leadingAnchor
            .constraint(equalTo: contentView.leadingAnchor)
        let trailing = tableView.trailingAnchor
            .constraint(equalTo: contentView.trailingAnchor)
        let top = tableView.topAnchor
            .constraint(equalTo: barView.bottomAnchor)
        let bottom = tableView.bottomAnchor
            .constraint(equalTo: contentView.bottomAnchor)

        NSLayoutConstraint.activate(
            [leading, trailing, top, bottom])
    }
    
    func activateConstraintsBarView() {
        barView.translatesAutoresizingMaskIntoConstraints = false
        let leading = barView.leadingAnchor
            .constraint(equalTo: contentView.leadingAnchor)
        let trailing = barView.trailingAnchor
            .constraint(equalTo: contentView.trailingAnchor)
        let top = barView.topAnchor
            .constraint(equalTo: contentView.topAnchor)
        let bottom = barView.bottomAnchor
            .constraint(equalTo: tableView.topAnchor)
        let height = barView.heightAnchor
            .constraint(equalToConstant: 50)

        NSLayoutConstraint.activate(
            [leading, trailing, top, bottom, height])
    }
    
    func activateConstraintsAddButton() {
        addButton.translatesAutoresizingMaskIntoConstraints = false
        let centerY = addButton.centerYAnchor
            .constraint(equalTo: barView.centerYAnchor)
        let trailing = addButton.trailingAnchor
            .constraint(equalTo: barView.trailingAnchor, constant: -10)

        NSLayoutConstraint.activate(
            [trailing, centerY])
    }

}



// MARK: - Dynamic behavior
extension ToDoListRootView {


    func bindViewModelToViews() {

    }



}

// MARK: - table datasource and delegate

extension ToDoListRootView: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = "text"

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}