//
//  WishStoringInteractor.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation

final class NewsInteractor: NewsBuisnessLogic, NewsDataStore {
    // MARK: - Constants
    enum Constants {
        static let rubricId: Int = 4
        static let pageSize: Int = 8
    }
    
    // MARK: - Variables
    private let presenter: NewsPresentaionLogic
    private let worker = NewsWorker()
    private let decoder: JSONDecoder = JSONDecoder()
    private var pageIndex: Int = 1
    
    // MARK: - Properties
    var articles: [ArticleModel] = []
    
    init(presenter: NewsPresentaionLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Use Cases
    public func loadFreshNews(_ request: News.LoadFreshNews.Request) {
        pageIndex = 1
        worker.fetchNews(rubricId: Constants.rubricId, pageSize: Constants.pageSize, pageIndex: pageIndex) { [weak self] response in
            DispatchQueue.global().async {
                switch response {
                case .success(let serverResponse):
                    if let data = serverResponse.data {
                        let newsPage = try? self?.decoder.decode(NewsPage.self, from: data)
                        DispatchQueue.main.async {
                            self?.articles = newsPage?.news ?? []
                            self?.presenter.presentFreshNews(News.LoadFreshNews.Response())
                        }
                    } else {
                        DispatchQueue.main.async {
                            print("No data")
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print(error)
                    }
                }
            }
        }
    }
    
    public func loadMoreNews(_ request: News.LoadMoreNews.Request) {
        pageIndex += 1
        worker.fetchNews(rubricId: Constants.rubricId, pageSize: Constants.pageSize, pageIndex: pageIndex) { [weak self] response in
            DispatchQueue.global(qos: .userInitiated).async {
                switch response {
                case .success(let serverResponse):
                    if let data = serverResponse.data {
                        let newsPage = try? self?.decoder.decode(NewsPage.self, from: data)
                        DispatchQueue.main.async {
                            self?.articles.append(contentsOf: newsPage?.news ?? [])
                            self?.presenter.presentMoreNews(News.LoadMoreNews.Response())
                        }
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print(error)
                    }
                }
            }
        }
    }
    
    func showWebArticle(_ request: News.ShowWebArticle.Request) {
        let article = articles[request.index]
        presenter.presentWebArticle(News.ShowWebArticle.Response(url: article.articleUrl!, navigationController: request.navigationController))
    }
    
    func shareArticle(_ request: News.ShareArticle.Request) {
        let article = articles[request.index]
        presenter.presentShareArticle(News.ShareArticle.Response(url: article.articleUrl!))
    }
}
