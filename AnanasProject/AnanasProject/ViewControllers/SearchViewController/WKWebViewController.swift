//
//  WKWebViewController.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 11.10.2022.
//

import UIKit
/// Информация о товаре из сети
final class WKWebViewController: UIViewController {
    
    // MARK: - Conctant
    private enum Constant {
        static let back = "chevron.left"
        static let forward = "chevron.forward"
    }
    
    // MARK: - Visual Components
    
    let wkWebView = UIWebView()
    
    var activityViewController = UIActivityViewController(activityItems: ["Ссылка"], applicationActivities: nil)
    
    private let loadProgressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .systemBlue
        progress.tintColor = .tertiaryLabel
        progress.setProgress(0.1, animated: true)
        return progress
    }()
    
    private let toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.barTintColor = .darkGray
        return toolBar
    }()

    private var loadingTimer: Timer?
    
    // MARK: - Public Properties
    
    var url = String()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        addConstraints()
    }
    
    // MARK: - Private Method
    private func createUI() {
        
        wkWebView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wkWebView)
        
        guard let myURL = URL(string: url) else { return }
        let request = URLRequest(url: myURL)
        wkWebView.loadRequest(request)
        
        toolBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(toolBar)
        
        loadProgressView.frame = CGRect(x: 0, y: 10, width: 250, height: 32)
        loadProgressView.center.x = toolBar.center.x
        toolBar.addSubview(loadProgressView)
        
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
        
        loadingTimer = Timer.scheduledTimer(timeInterval: 1,
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
        loadProgressView.progress += 0.1
    }
    
    @objc private func backButtonItemAction() {
        guard wkWebView.canGoBack else { return }
        wkWebView.goBack()
    }
    
    @objc private func forwardButtonItemAction() {
        guard wkWebView.canGoForward else { return }
        wkWebView.goForward()
    }
                                                
    @objc func refreshButtonItemAction() {
        wkWebView.reload()
    }
}
