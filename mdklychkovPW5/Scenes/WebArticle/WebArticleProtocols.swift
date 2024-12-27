//
//  Protocols.swift
//  SVIP
//
//  Created by Maksim Klychkov on 22.10.2024.
//

protocol WebArticleBuisnessLogic {
    func loadURL(_ request: WebArticle.LoadURL.Request)
}

protocol WebArticlePresentaionLogic {
    func presentLoadedURL(_ response: WebArticle.LoadURL.Response)
}
