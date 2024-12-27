//
//  Interactor.swift
//  SVIP
//
//  Created by Maksim Klychkov on 22.10.2024.
//

import Foundation

final class WebArticleInteractor: WebArticleBuisnessLogic {
    private let presenter: WebArticlePresentaionLogic
    private let url: URL
    
    init(presenter: WebArticlePresentaionLogic, url: URL) {
        self.presenter = presenter
        self.url = url
    }
    
    func loadURL(_ request: WebArticle.LoadURL.Request) {
        presenter.presentLoadedURL(WebArticle.LoadURL.Response(url: url))
    }
}
