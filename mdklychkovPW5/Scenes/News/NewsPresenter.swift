//
//  WishStoringPresenter.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation
import UIKit

final class NewsPresenter: NewsPresentaionLogic {
    // MARK: - Variables
    weak var view: NewsViewController?
    
    // MARK: - Public funcs
    func presentFreshNews(_ response: News.LoadFreshNews.Response) {
        view?.displayLoadedFreshNews()
    }
    
    func presentMoreNews(_ response: News.LoadMoreNews.Response) {
        view?.displayLoadedMoreNews()
    }
    
    func presentWebArticle(_ response: News.ShowWebArticle.Response) {
        response.navigationController?.pushViewController(WebArticleAssembly.build(withURL: response.url), animated: true)
    }
    
    func presentShareArticle(_ response: News.ShareArticle.Response) {
        let activityVC = UIActivityViewController(activityItems: [response.url], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = view?.view
        view?.present(activityVC, animated: true)
    }
}
