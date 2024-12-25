//
//  NewsAssembly.swift
//  mdklychkovPW5
//
//  Created by Maksim Klychkov on 25.12.2024.
//

import UIKit

enum NewsAssembly {
    // MARK: - Build
    static func build() -> UIViewController {
        let presenter = NewsPresenter()
        let interactor = NewsInteractor(presenter: presenter)
        let viewController = NewsViewController(interactor: interactor)
        presenter.view = viewController
        
        return viewController
    }
}
