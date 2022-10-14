//
//  WKWebViewController.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 11.10.2022.
//
import UIKit
import WebKit

/// Информация о товаре из сети
final class WKWebViewController: UIViewController {
    
    // MARK: - Conctant
    private enum Constant {
        static let back = "chevron.left"
        static let forward = "chevron.forward"
    }
    
    // MARK: - Visual Components
    let wkWebView = WKWebView()
    
    let loadProgressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .systemBlue
        progress.tintColor = .tertiaryLabel
        progress.setProgress(0.0, animated: false)
        return progress
    }()
    
    private let toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.barTintColor = .darkGray
        return toolBar
    }()
    
    private lazy var activityViewController = UIActivityViewController(activityItems: ["\(self.urlName)"],
                                                                       applicationActivities: nil)
    private var loadingTimer: Timer?
    
    // MARK: - Public Properties
    var urlName = String()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        createBarButtonItem()
        getURL()
        addConstraints()
    }
    
    // MARK: - Private Method
    private func getURL() {
        guard let myURL = URL(string: urlName) else { return }
        let request = URLRequest(url: myURL)
        wkWebView.load(request)
    }
    
    private func createBarButtonItem() {
        
        let backButtonItem = UIBarButtonItem(image: UIImage(systemName: Constant.back),
                                             style: .done,
                                             target: self,
                                             action: #selector(backButtonItemAction))
        let forwardButtonItem = UIBarButtonItem(image: UIImage(systemName: Constant.forward),
                                                style: .done,
                                                target: self,
                                                action: #selector(forwardButtonItemAction))
        
        let load = UIBarButtonItem(customView: loadProgressView)
        let refreshButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh,
                                                target: self,
                                                action: #selector(refreshButtonItemAction))
        
        let shareButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                              target: self,
                                              action: #selector(shareButtonItemAction))
        
        toolBar.items = [backButtonItem, forwardButtonItem, load, refreshButtonItem, shareButtonItem]
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toolBar)
    }
    
    private func createUI() {
        
        wkWebView.navigationDelegate = self
        
        wkWebView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wkWebView)
        
        loadProgressView.frame = CGRect(x: 0, y: 10, width: 250, height: 32)
        loadProgressView.center.x = toolBar.center.x
        toolBar.addSubview(loadProgressView)
        
        loadingTimer = Timer.scheduledTimer(timeInterval: 0.01,
                                             target: self,
                                             selector: #selector(loadProgressAction),
                                             userInfo: nil,
                                             repeats: true)
    }
    
    private func addConstraints() {
        
        NSLayoutConstraint.activate([
            wkWebView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            wkWebView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            wkWebView.topAnchor.constraint(equalTo: view.topAnchor),
            wkWebView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            toolBar.leadingAnchor.constraint(equalTo: wkWebView.leadingAnchor),
            toolBar.trailingAnchor.constraint(equalTo: wkWebView.trailingAnchor),
            toolBar.bottomAnchor.constraint(equalTo: wkWebView.bottomAnchor)
        ])
    }
    
    @objc private func shareButtonItemAction() {
    
        present(activityViewController,
                animated: true,
                completion: nil)
    }
    
    @objc private func loadProgressAction() {
        loadProgressView.progress += 0.0005
    }
    
    @objc private func backButtonItemAction() {
        loadProgressView.setProgress(0.0, animated: false)
        guard wkWebView.canGoBack else { return }
        
        loadProgressView.progress += 0.0005
        wkWebView.goBack()
    }
    
    @objc private func forwardButtonItemAction() {
        
        loadProgressView.setProgress(0.0, animated: false)
        guard wkWebView.canGoForward else { return }
        
        loadProgressView.progress += 0.0005
        wkWebView.goForward()
    }
    
    @objc func refreshButtonItemAction() {
        
        loadProgressView.setProgress(0.0, animated: false)
        loadProgressView.progress += 0.0005
        wkWebView.reload()
    }
}

extension WKWebViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        loadProgressView.progress += 1.0
    }
}
