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
    }

    func activateConstraints() {
        activateConstraintsContentView()
        activateConstraintsTableView()
    }

    func wireController() {

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
            .constraint(equalTo: contentView.topAnchor)
        let bottom = tableView.bottomAnchor
            .constraint(equalTo: contentView.bottomAnchor)

        NSLayoutConstraint.activate(
            [leading, trailing, top, bottom])
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
