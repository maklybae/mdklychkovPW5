//
//  Presenter.swift
//  SVIP
//
//  Created by Maksim Klychkov on 22.10.2024.
//

import UIKit

final class WebArticlePresenter: WebArticlePresentaionLogic {
    weak var view: WebArticleViewController?
    
    func presentLoadedURL(_ response: WebArticle.LoadURL.Response) {
        view?.loadURL(response.url)
    }
}
