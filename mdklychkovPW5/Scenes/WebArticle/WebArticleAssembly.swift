//
//  Assembly.swift
//  SVIP
//
//  Created by Maksim Klychkov on 22.10.2024.
//

import UIKit

enum WebArticleAssembly {
    static func build(withURL url: URL) -> UIViewController {
        let presenter = WebArticlePresenter()
        let interactor = WebArticleInteractor(presenter: presenter, url: url)
        let view = WebArticleViewController(interactor: interactor)
        presenter.view = view
        return view
    }
}
