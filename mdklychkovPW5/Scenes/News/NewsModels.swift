//
//  WishStoringModels.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import UIKit

enum News {
    // MARK: - ViewModels
    
    
    // MARK: - Use Cases
    enum LoadFreshNews {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum LoadMoreNews {
        struct Request {
        }
        struct Response {
        }
        struct ViewModel {
        }
    }
    
    enum ShowWebArticle {
        struct Request {
            var index: Int
            var navigationController: UINavigationController?
        }
        struct Response {
            var url: URL
            var navigationController: UINavigationController?
        }
        struct ViewModel {
        }
    }
}
