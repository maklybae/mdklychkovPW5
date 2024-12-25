//
//  Endpoint.swift
//  sem-network
//
//  Created by Maksim Klychkov on 05.11.2024.
//

import Foundation

protocol Endpoint {
    var compositePath: String { get }
    var headers: [String: String] { get }
    var parameters: [String: String]? { get }
}

extension Endpoint {
    var parameters: [String: String]? { return nil }
}
