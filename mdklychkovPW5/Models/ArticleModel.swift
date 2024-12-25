//
//  ArticleModel.swift
//  mdklychkovPW5
//
//  Created by Maksim Klychkov on 25.12.2024.
//

import Foundation

struct ArticleModel: Decodable {
    var newsId: Int?
    var title: String?
    var announce: String?
    var img: ImageContainer?
    var requestId: String?
    var articleUrl: URL? {
        let requestId = requestId ?? ""
        let newsId = newsId ?? 0
        return URL(string: "https://news.myseldon.com/ru/news/index/\(newsId)?requestId=\(requestId)")
    }
}

struct ImageContainer: Decodable {
    var url: URL?
}

struct NewsPage: Decodable {
    var news: [ArticleModel]?
    var requestId: String?
    
    init(news: [ArticleModel]?, requestId: String?) {
        self.news = news?.map { article in
            var article = article
            article.requestId = requestId
            return article
        }
        self.requestId = requestId
    }
}
