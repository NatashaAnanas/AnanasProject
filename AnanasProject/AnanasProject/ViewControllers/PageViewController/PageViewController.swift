//
//  MyPageViewController.swift
//  PageViewController_dz_20
//
//  Created by Анастасия Козлова on 13.10.2022.
//

import UIKit

/// Базовый PageViewController
final class BasePageViewController: UIPageViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let skipButtonTitle = "SKIP"
        static let nextButtonTitle = "NEXT"
        static let getStartedButtonTitle = "GET STARTED!"
        static let userDefaults = "new"
    }
    
    // MARK: - Visual Components
    private let nextButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.nextButtonTitle, for: .normal)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()
    
    private let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.skipButtonTitle, for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        return button
    }()
    
    private let getStartedButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle(Constants.getStartedButtonTitle, for: .normal)
        button.backgroundColor = .white
        button.isHidden = true
        return button
    }()
    
    private let storage = Storage.shared
    private var myControllers: [UIViewController] = []
    private var pageControl = UIPageControl.appearance(whenContainedInInstancesOf: [BasePageViewController.self])
    
    override init(transitionStyle style: UIPageViewController.TransitionStyle,
                  navigationOrientation: UIPageViewController.NavigationOrientation,
                  options: [UIPageViewController.OptionsKey: Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        self.dataSource = self
        self.delegate = self
        
        createUI()
        presentVC()
        settingtPageVC()
        actions()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Method
    
    private func createUI() {
        view.backgroundColor = .white
        
        nextButton.frame = CGRect(x: 270, y: 830, width: 70, height: 40)
        view.addSubview(nextButton)
        
        skipButton.frame = CGRect(x: 80, y: 830, width: 70, height: 40)
        view.addSubview(skipButton)
        
        getStartedButton.frame = CGRect(x: 0, y: 830, width: 140, height: 40)
        getStartedButton.center.x = view.center.x
        view.addSubview(getStartedButton)
    }
    
    private func presentVC() {
        
        for text in storage.firstText {
            
            guard let count = storage.firstText.firstIndex(of: text) else { return }
            
            let onboardingVC = OnboardingViewController(with: text,
                                                        info: storage.secondText[count],
                                                        image: storage.images[count])
            myControllers.append(onboardingVC)
        }
    }
    
    private func settingtPageVC() {
        pageControl.pageIndicatorTintColor = .tertiaryLabel
        pageControl.currentPageIndicatorTintColor = .systemBlue
        
        setViewControllers([myControllers[0]],
                           direction: .forward,
                           animated: true,
                           completion: nil)
    }
    
    private func actions() {
        nextButton.addTarget(self,
                             action: #selector(nextButtonAction(sender: )),
                             for: .touchUpInside)
        skipButton.addTarget(self,
                             action: #selector(doToTabBar(sender: )),
                             for: .touchUpInside)
        
        getStartedButton.addTarget(self,
                                   action: #selector(doToTabBar(sender: )),
                                   for: .touchUpInside)
    }
    
    private func showButtons(index: Int) {
        switch index {
        case 0, 1:
            getStartedButton.isHidden = true
            skipButton.isHidden = false
            nextButton.isHidden = false
        case 2:
            getStartedButton.isHidden = false
            skipButton.isHidden = true
            nextButton.isHidden = true
        default:
            break
        }
    }
    
    @objc private func nextButtonAction(sender: UIButton) {
        
        guard let pageControl = view.subviews.first(where: { $0 is UIPageControl }) as? UIPageControl,
              pageControl.currentPage != 2 else { return }
        let index = pageControl.currentPage
        
        setViewControllers([myControllers[index + 1]],
                           direction: .forward,
                           animated: true)
        pageControl.currentPage += index + 1
    }
    
    @objc private func doToTabBar(sender: UIButton) {
        
        let tabBarVC = BaseTabBarController()
        tabBarVC.modalPresentationStyle = .fullScreen
        present(tabBarVC, animated: true)
        let userDefaults = UserDefaults.standard
        userDefaults.set("load", forKey: Constants.userDefaults)
    }
}

extension BasePageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print("pageViewController before start")
        guard let viewController = viewController as? OnboardingViewController else {
            return nil }
        
        guard let index = myControllers.firstIndex(of: viewController), index > 0 else {
            print("pageViewController before nil")
            return nil
        }
        let before = index - 1
        print("pageViewController before")
        return myControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print("pageViewController after start")
        guard let viewController = viewController as? OnboardingViewController else {
            return nil }
        
        guard let index = myControllers.firstIndex(of: viewController), index < (myControllers.count - 1) else {
            print("pageViewController after nil")
            return nil
        }
        let after = index + 1
        print("pageViewController after")
        return myControllers[after]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        print("presentationCount = 3")
        return myControllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        print("presentationIndex = 0")
        return 0
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        
        guard let index = pageViewController.viewControllers?[0],
              let currentIndex = myControllers.firstIndex(of: index) else { return }
        pageControl.currentPage = currentIndex
        showButtons(index: currentIndex)
        print("pageViewController")
    }
}

extension BasePageViewController: UIPageViewControllerDataSource {
}
