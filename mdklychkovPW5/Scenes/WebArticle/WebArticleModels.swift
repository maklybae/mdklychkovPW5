//
//  Models.swift
//  SVIP
//
//  Created by Maksim Klychkov on 22.10.2024.
//

import Foundation

enum WebArticle {
    // MARK: - Use Cases
    enum LoadURL {
        struct Request { }
        struct Response {
            var url: URL
        }
        struct ViewModel { }
    }
}
