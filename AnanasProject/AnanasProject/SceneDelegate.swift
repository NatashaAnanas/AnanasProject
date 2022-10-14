//
//  SceneDelegate.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 05.10.2022.
//

import UIKit
/// SceneDelegate
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = scene as? UIWindowScene else { return }
        
        window?.windowScene = scene
        
        let userDefaults = UserDefaults.standard
        
        if userDefaults.object(forKey: "new") != nil {
            let tabBarVC = BaseTabBarController()
            self.window?.rootViewController = tabBarVC
        } else {
            let pageVC = BasePageViewController()
            self.window?.rootViewController = pageVC
        }
        window?.makeKeyAndVisible()
    }
}
