//
//  BaseTabBarController.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 05.10.2022.
//
import UIKit

/// Базовый TabBarController
final class BaseTabBarController: UITabBarController {
    
    private enum Constant {
        static let buyTitel = "КУПИТЬ"
        static let forYouTitel = "ДЛЯ ВАС"
        static let searchTitel = "ПОИСК"
        static let bagTitel = "КОРЗИНА"
        static let iphoneName = "laptopcomputer.and.iphone"
        static let personName = "person.circle"
        static let magnifyingglassName = "magnifyingglass"
        static let bagName = "bag"
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            createViewController(viewController: BuyViewController(),
                                 titel: Constant.buyTitel,
                                 image: Constant.iphoneName),
            createViewController(viewController: LoadingViewController(),
                                 titel: Constant.forYouTitel, image: Constant.personName),
            createViewController(viewController: SearchViewController(),
                                 titel: Constant.searchTitel, image: Constant.magnifyingglassName),
            createViewController(viewController: BagViewController(),
                                 titel: Constant.bagTitel,
                                 image: Constant.bagName)
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
