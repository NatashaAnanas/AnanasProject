//
//  BuyViewController.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 05.10.2022.
//
import UIKit
/// Контроллер с разделом "Купить"
final class BuyViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    // MARK: - Private Method
    private func createUI() {
        view.backgroundColor = .systemYellow
    }
}
