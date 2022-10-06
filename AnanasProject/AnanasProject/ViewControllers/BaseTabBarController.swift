//
//  BaseTabBarController.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 05.10.2022.
//

import UIKit
/// Базовый TabBarController
class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            createViewController(viewController: ViewController(), titel: "ПОИСК", image: "search"),
            createViewController(viewController: ViewControllerOne(), titel: "КОРЗИНА", image: "bag"),
            createViewController(viewController: ViewControllerTwo(), titel: "house", image: "house"),
            createViewController(viewController: ViewControllerThree(), titel: "wimdo", image: "person.circle")
        ]
    }
    private func createViewController(viewController: UIViewController,
                                      titel: String,
                                      image: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = titel
        viewController.view.backgroundColor = .white
//        navController.tabBarItem.title = titel
        
        navController.tabBarItem.badgeColor = .purple
        navController.tabBarItem.badgeValue = "New"
        
        navController.toolbar.barTintColor = .systemYellow
        navController.toolbar.barStyle = .black
        navController.toolbar.barTintColor = .red
        navController.toolbar.tintColor = .purple
        navController.toolbar.backgroundColor = .orange
        
        navController.navigationBar.tintColor = .red
        navController.navigationBar.tintColor = .orange
        
        navController.tabBarItem.image = UIImage(systemName: image)
        
        return navController
    }
}
