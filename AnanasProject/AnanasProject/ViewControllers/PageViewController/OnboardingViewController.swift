//
//  TextViewController.swift
//  PageViewController_dz_20
//
//  Created by Анастасия Козлова on 13.10.2022.
//
import UIKit

/// Onboarding контроллер
final class OnboardingViewController: UIViewController {
    
    // MARK: - Visual Components
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let firstLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .center
        label.alpha = 0.0
        return label
    }()
    
    private let secondLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 22)
        label.textAlignment = .center
        label.alpha = 0.0
        label.numberOfLines = 0
        return label
    }()
    
    private let myText: String
    
    init(with text: String, info: String, image: String) {
        self.myText = text
        self.firstLabel.text = self.myText
        self.secondLabel.text = info
        self.backgroundImageView.image = UIImage(named: image)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animations()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        newSettings()
    }
    
    // MARK: - Private Methods
    private func createUI() {
        
        backgroundImageView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(backgroundImageView)
        
        firstLabel.frame = CGRect(x: 0, y: 580, width: 300, height: 80)
        firstLabel.center.x = view.center.x
        backgroundImageView.addSubview(firstLabel)
        
        secondLabel.frame = CGRect(x: 0, y: 650, width: 350, height: 80)
        secondLabel.center.x = view.center.x
        backgroundImageView.addSubview(secondLabel)
    }
    
    private func newSettings() {
        firstLabel.alpha = 0.0
        secondLabel.alpha = 0.0
    }
    
    private func animations() {
        UIView.animate(withDuration: 1) {
            self.firstLabel.alpha = 1.0
            self.secondLabel.alpha = 1.0
        }
    }
}
