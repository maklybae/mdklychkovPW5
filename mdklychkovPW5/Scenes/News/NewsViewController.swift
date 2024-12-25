//
//  WishStoringViewController.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.11.2024.
//

import UIKit

final class NewsViewController: UIViewController {
    // MARK: - Constants
    enum Constants {
    }
    
    // MARK: - Variables
    private let interactor: NewsBuisnessLogic & NewsDataStore
    
    // MARK: - Lifecycle
    init(interactor: NewsBuisnessLogic & NewsDataStore) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
    }
    
    // MARK: Public funcs
    
    // MARK: - Private funcs
}

// MARK: - Extension UITableViewDataSource
