//
//  ViewController.swift
//  SVIP
//
//  Created by Maksim Klychkov on 22.10.2024.
//

import UIKit
import WebKit
import SkeletonView

final class WebArticleViewController: UIViewController {
    // MARK: - Constants
    private let interactor: WebArticleBuisnessLogic
    private let webView = WKWebView()
    
    // MARK: - Lifecycle
    init(interactor: WebArticleBuisnessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        interactor.loadURL(WebArticle.LoadURL.Request())
    }
    
    private func setupUI() {
        title = "Article"
        view.backgroundColor = .systemBackground
        
        view.isSkeletonable = true
        view.addSubview(webView)
        
        webView.navigationDelegate = self
        webView.pinHorizontal(to: view)
        webView.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        webView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    // MARK: - Public funcs
    public func loadURL(_ url: URL) {
        view.showAnimatedGradientSkeleton()
        webView.load(URLRequest(url: url))
    }
    
    // MARK: - Error Handling
    private func showError(_ message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
        dismiss(animated: true)
    }
}

// MARK: - Extension WKNavigationDelegate
extension WebArticleViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        view.hideSkeleton(transition: .crossDissolve(0.25))
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        view.hideSkeleton(transition: .crossDissolve(0.25))
        showError("Failed to load webpage. Please try again later.")
    }
}

