//
//  ViewControllerThree.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 05.10.2022.
//
import UIKit
/// Контроллер с разделом "Корзина"
final class BagViewController: UIViewController {
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    // MARK: - Private Method
    private func createUI() {
        view.backgroundColor = .green
    }
}
