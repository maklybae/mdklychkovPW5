//
//  WishStoringProtocols.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

// MARK: - BuisnessLogic protocol
protocol NewsBuisnessLogic {
    func loadFreshNews(_ request: News.LoadFreshNews.Request)
    func loadMoreNews(_ request: News.LoadMoreNews.Request)
    func showWebArticle(_ request: News.ShowWebArticle.Request)
    func shareArticle(_ request: News.ShareArticle.Request)
}

// MARK: - DataStore protocol
protocol NewsDataStore {
    var articles: [ArticleModel] { get set }
}

// MARK: - PresentationLogic protocol
protocol NewsPresentaionLogic {
    func presentFreshNews(_ response: News.LoadFreshNews.Response)
    func presentMoreNews(_ response: News.LoadMoreNews.Response)
    func presentWebArticle(_ response: News.ShowWebArticle.Response)
    func presentShareArticle(_ response: News.ShareArticle.Response)
}
