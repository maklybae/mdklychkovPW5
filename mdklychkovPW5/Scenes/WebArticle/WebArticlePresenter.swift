//
//  Presenter.swift
//  SVIP
//
//  Created by Maksim Klychkov on 22.10.2024.
//

import UIKit

final class WebArticlePresenter: WebArticlePresentaionLogic {
    // MARK: - Variables
    weak var view: WebArticleViewController?
    
    // MARK: - Public funcs
    func presentLoadedURL(_ response: WebArticle.LoadURL.Response) {
        view?.loadURL(response.url)
    }
}
