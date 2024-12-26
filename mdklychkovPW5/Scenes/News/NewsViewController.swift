//
//  WishStoringViewController.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.11.2024.
//

import UIKit
import Kingfisher

final class NewsViewController: UIViewController {
    // MARK: - Constants
    enum Constants {
    }
    
    // MARK: - Variables
    private let interactor: NewsBuisnessLogic & NewsDataStore
    lazy private var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        return activityIndicator
    }()
    
    // MARK: - Lifecycle
    init(interactor: NewsBuisnessLogic & NewsDataStore) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        title = "News Feed"
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        tableView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        tableView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        tableView.pinLeft(to: view.leadingAnchor)
        tableView.pinRight(to: view.trailingAnchor)
        
        interactor.loadFreshNews(News.LoadFreshNews.Request())
    }
    
    
    // MARK: - Public funcs
    public func displayLoadedNews() {
        tableView.reloadData()
    }
    
    // MARK: - Private funcs
}

// MARK: - Extension UITableViewDataSource
extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        interactor.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.reuseIdentifier, for: indexPath) as! ArticleCell
        cell.configure(with: interactor.articles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == interactor.articles.count - 1 {
            activityIndicator.startAnimating()
            tableView.tableFooterView = activityIndicator
        }
    }
}
