//
//  ListController.swift
//  GitHubRepos
//
//  Created by emile on 20/02/2021.
//

import UIKit
import Combine

final class ListController: UITableViewController, ListViewModelInjected {
    
    @Published var items = [ListItem]() {
        didSet {
            if items.count > 0 {
                indicator.stopAnimating()
                tableView.reloadData()
            }
        }
    }
    
    private var disposables: Set<AnyCancellable> = []
    
    private lazy var indicator: UIActivityIndicatorView = {
        UIActivityIndicatorView(style: .large)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureBinding()
        configureLongPress()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadItems()
    }
}

// MARK: - Actions
private extension ListController {
    func loadItems() {
        indicator.startAnimating()
        listViewModel.get()
    }
}

// MARK: - Binding
extension ListController {
    func configureBinding() {
        listViewModel.$items
            .receive(on: RunLoop.main)
            .assign(to: \.items, on: self)
            .store(in: &disposables)
    }
}

// MARK: - UI
extension ListController {
    private func configureView() {
        title = "GitHub Repos"
        view.backgroundColor = .white

        tableView.register(ListCell.self, forCellReuseIdentifier: ListCell.reuseIdentifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.backgroundView = indicator
        tableView.allowsSelection = false
    }
}

// MARK: - UITableViewDataSource
extension ListController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ListCell.reuseIdentifier, for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
        
        cell.configure(items[indexPath.row])
        
        return cell
    }
}

// MARK: - UIGestureRecognizerDelegate
extension ListController: UIGestureRecognizerDelegate {
    func configureLongPress() {
        let longPressGesture:UILongPressGestureRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.handleLongPress))
        longPressGesture.minimumPressDuration = 0.5
        longPressGesture.delegate = self
        tableView.addGestureRecognizer(longPressGesture)
    }
    
    @objc func handleLongPress(_ gestureRecognizer: UILongPressGestureRecognizer){
        if gestureRecognizer.state == .began {
            let touchPoint = gestureRecognizer.location(in: self.tableView)
            if let indexPath = tableView.indexPathForRow(at: touchPoint) {
                listViewModel.open(items[indexPath.row].htmlUrl)
            }
        }
    }
}
