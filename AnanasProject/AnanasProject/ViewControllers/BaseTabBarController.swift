//
//  BaseTabBarController.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 05.10.2022.
//

import UIKit
/// Базовый TabBarController
final class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            createViewController(viewController: BuyViewController(),
                                 titel: "КУПИТЬ",
                                 image: "laptopcomputer.and.iphone"),
            createViewController(viewController: ForYouViewControllerOne(),
                                 titel: "ДЛЯ ВАС", image: "person.circle"),
            createViewController(viewController: SearchViewController(),
                                 titel: "ПОИСК", image: "magnifyingglass"),
            createViewController(viewController: BagViewControllerThree(),
                                 titel: "КОРЗИНА",
                                 image: "bag")
        ]
    }
    
    // MARK: - Private Method
    
    private func createViewController(viewController: UIViewController,
                                      titel: String,
                                      image: String) -> UIViewController {
        
        let navController = UINavigationController(rootViewController: viewController)
        
        navController.navigationBar.prefersLargeTitles = true
        navController.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navController.tabBarItem.title = titel
        navController.tabBarItem.image = UIImage(systemName: image)
        
        viewController.navigationItem.title = titel
        
        tabBar.backgroundColor = UIColor(red: 18.0/255,
                                         green: 18.0/255,
                                         blue: 18.0/255,
                                         alpha: 1.0)
        
        return navController
    }
}
