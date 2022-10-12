//
//  PdfViewController.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 12.10.2022.
//

import UIKit
/// Открытие PDF файла
final class PdfViewController: UIViewController {
    
    // MARK: - Constant
    
    private enum Constant {
        static let pdfName = "SwiftRazrabPrilozhUIKit"
        static let format = "pdf"
    }

    // MARK: - Visual Components
    
    private let wkWebView = UIWebView()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        openPdf()
    }
    
    // MARK: - Private Method
    private func openPdf() {
        
        wkWebView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(wkWebView)
        
        guard let pdfUrl = Bundle.main.url(forResource: Constant.pdfName,
                                           withExtension: Constant.format) else { return }
        
        let request = URLRequest(url: pdfUrl)
        wkWebView.loadRequest(request)
    }
}
