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
    private let tableView = UITableView(frame: .zero, style: .plain)
    private let activityIndicator = UIActivityIndicatorView(style: .medium)
    
    // MARK: - Properties
    private var loadMoreStatus = false {
        didSet {
            activityIndicator.isHidden = !loadMoreStatus
            if loadMoreStatus {
                activityIndicator.startAnimating()
            } else {
                activityIndicator.stopAnimating()
            }
        }
    }
    
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
        
        configureTableView()
        configureActivityIndicator()
        
        interactor.loadFreshNews(News.LoadFreshNews.Request())
    }
    
    
    // MARK: - Public funcs
    public func displayLoadedFreshNews() {
        tableView.reloadData()
    }
    
    public func displayLoadedMoreNews() {
        loadMoreStatus = false
        tableView.reloadData()
    }
    
    // MARK: - Private funcs
    private func configureTableView() {
        tableView.backgroundColor = .systemBackground
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        tableView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        tableView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        tableView.pinLeft(to: view.leadingAnchor)
        tableView.pinRight(to: view.trailingAnchor)
    }
    
    private func configureActivityIndicator() {
        activityIndicator.frame = CGRect(x: 0, y: 0, width: tableView.rowHeight, height: 44)
        activityIndicator.hidesWhenStopped = true
        tableView.tableFooterView = activityIndicator
    }
    
    private func loadMore() {
        if ( !loadMoreStatus ) {
            loadMoreStatus = true
            interactor.loadMoreNews(News.LoadMoreNews.Request())
        }
    }
}

// MARK: - Extension UITableViewDataSource
extension NewsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        interactor.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.reuseIdentifier, for: indexPath) as! ArticleCell
        cell.configure(with: interactor.articles[indexPath.row])
        
        return cell
    }
}

// MARK: - Extension UITableViewDelegate
extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == interactor.articles.count - 1 {
            loadMore()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        interactor.showWebArticle(News.ShowWebArticle.Request(index: indexPath.row, navigationController: navigationController))
    }
}
