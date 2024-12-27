//
//  WebArticleViewController.swift
//  mdklychkovPW5
//
//  Created by Maksim Klychkov on 27.12.2024.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {
    // MARK: - Properties
    private let url: URL
    private var webView: WKWebView!
    
    // MARK: - Initializer
    init(url: URL) {
        self.url = url
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupWebView()
        loadURL()
    }
    
    // MARK: - Setup
    private func setupWebView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func loadURL() {
        webView.load(URLRequest(url: url))
    }
    
    // MARK: - Error Handling
    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

// MARK: - WKNavigationDelegate
extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        showError("Failed to load webpage. Please try again later.")
    }
}
