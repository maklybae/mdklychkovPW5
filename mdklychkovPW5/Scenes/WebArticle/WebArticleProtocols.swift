//
//  Protocols.swift
//  SVIP
//
//  Created by Maksim Klychkov on 22.10.2024.
//

// MARK: - BuisnessLogic protocol
protocol WebArticleBuisnessLogic {
    func loadURL(_ request: WebArticle.LoadURL.Request)
}

// MARK: - PresentationLogic protocol
protocol WebArticlePresentaionLogic {
    func presentLoadedURL(_ response: WebArticle.LoadURL.Response)
}
