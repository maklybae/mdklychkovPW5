//
//  WishStoringInteractor.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation

final class NewsInteractor: NewsBuisnessLogic, NewsDataStore {
    // MARK: - Variables
    private let presenter: NewsPresentaionLogic
    private let worker = NewsWorker()
    
    // MARK: - Properties
    var articles: [ArticleModel] = []
    
    init(presenter: NewsPresentaionLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Use Cases
    func loadFreshNews(_ request: News.LoadFreshNews.Request) {
        <#code#>
    }
    
    func loadMoreNews(_ request: News.LoadMoreNews.Request) {
        <#code#>
    }
}
