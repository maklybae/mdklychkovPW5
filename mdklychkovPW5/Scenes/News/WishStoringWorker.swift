//
//  WishStoringWorker.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation

// MARK: - NewsSeldon Endpoint
enum NewsSeldonEndpoint : Endpoint {
    case news(rubricId: Int, pageSize: Int, pageIndex: Int)
    
    var compositePath: String {
        switch self {
        case .news:
            return "api/Section"
        }
    }
    
    var headers: [String : String] {
           return [:]
       }
    
    var parameters: [String : String]? {
        switch self {
        case .news(let rubricId, let pageSize, let pageIndex):
            return [
                "rubricId": String(rubricId),
                "pageSize": String(pageSize),
                "pageIndex": String(pageIndex)
            ]
        }
    }
}

// MARK: - NewsWorker
final class NewsWorker {
    private let urlWorker = BaseURLWorker(baseURL: "https://news.myseldon.com")
    private let decoder: JSONDecoder = JSONDecoder()
    
    // MARK: - Constants
    private enum Constants {
    }
    
    // MARK: Public funcs
    public func fetchNews(rubricId: Int, pageSize: Int, pageIndex: Int, completion: @escaping (Result<Networking.ServerResponse, Error>) -> Void){
        let request = Request(endpoint: NewsSeldonEndpoint.news(rubricId: rubricId, pageSize: pageSize, pageIndex: pageIndex))
        urlWorker.execute(with: request, completion: completion)
    }
}
