//
//  WishStoringInteractor.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.11.2024.
//

import Foundation

final class NewsInteractor: NewsBuisnessLogic {
    // MARK: - Variables
    private let presenter: NewsPresentaionLogic
    private let worker = NewsWorker()
    
    init(presenter: NewsPresentaionLogic) {
        self.presenter = presenter
    }
    
    // MARK: - Use Cases
}
