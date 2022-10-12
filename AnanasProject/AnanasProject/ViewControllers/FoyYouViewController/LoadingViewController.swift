//
//  LoadingViewController.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 12.10.2022.
//

import UIKit
/// Загрузк страницы
class LoadingViewController: UIViewController {
    
    // MARK: - Constant
    
    private enum Constant {
        static let air = "air1"
        static let loading = "Loading..."
    }
    // MARK: - Visual Components
    
    private var aiPodsImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constant.air)
        return image
    }()
    
    private let loadProgressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .green
        progress.tintColor = .tertiaryLabel
        progress.setProgress(0.1, animated: true)
        return progress
    }()
    
    private var loadingTimer: Timer?
    
    private let loadingLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.loading
        label.font = .boldSystemFont(ofSize: 25)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Public Properties
    
    private var count = 0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }

    // MARK: - Life cycle
    private func createUI() {
        
        view.backgroundColor = .white
        
        aiPodsImageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        aiPodsImageView.center = view.center
        view.addSubview(aiPodsImageView)
        
        loadProgressView.frame = CGRect(x: 0, y: 600, width: 320, height: 31)
        loadProgressView.center.x = view.center.x
        view.addSubview(loadProgressView)
        
        loadingLabel.frame = CGRect(x: 0, y: 550, width: 150, height: 30)
        loadingLabel.center.x = view.center.x
        view.addSubview(loadingLabel)
        
        loadingTimer = Timer.scheduledTimer(timeInterval: 0.4,
                                             target: self,
                                             selector: #selector(loading),
                                             userInfo: nil,
                                             repeats: true)
    }
    
    @objc private func loading() {
        
        count += 1
        if 1...9  ~= count {
        loadProgressView.progress += 0.1
        
        guard loadProgressView.progress == 1.0  else { return }
        let forYouViewController  = ForYouViewController()
        navigationController?.modalPresentationStyle = .fullScreen
        show(forYouViewController, sender: nil)
        }
        loadProgressView.setProgress(0.0, animated: true)
        count = 0
    }
}
