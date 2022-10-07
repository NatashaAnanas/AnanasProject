//
//  InfoViewController.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 07.10.2022.
//

import UIKit
/// Контроллер с разделом "Для вас"
final class InfoViewController: UIViewController {
    
    private enum Constant {
        static let addToBag = "Добавить в корзину"
    }
    
    // MARK: - Visual Components
    
    private let addBagButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constant.addToBag, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.backgroundColor = .systemBlue
        button.clipsToBounds = true
        button.layer.cornerRadius = 5
        return button
    }()
    
    private let separateProgressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .bar)
        progress.setProgress(0.3, animated: true)
        progress.backgroundColor = .tertiaryLabel
        progress.progressTintColor = .lightGray
        return progress
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let photoImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        addItems()
        
        // MARK: - Public Method
        func createUI() {
            view.backgroundColor = .black
            
            photoImageView.frame = CGRect(x: 0, y: 200, width: 300, height: 200)
            photoImageView.center.x = view.center.x
            view.addSubview(photoImageView)
            
            infoLabel.frame = CGRect(x: 0, y: 110, width: 400, height: 50)
            infoLabel.center.x = view.center.x
            view.addSubview(infoLabel)
            
            addBagButton.frame = CGRect(x: 0, y: 660, width: 340, height: 35)
            addBagButton.center.x = view.center.x
            view.addSubview(addBagButton)
            
            separateProgressView.frame  = CGRect(x: 0, y: 420, width: 350, height: 50)
            separateProgressView.center.x = view.center.x
            view.addSubview(separateProgressView)
        }
        
        func addItems() {
            navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: "square.and.arrow.up"),
                                                                  style: .done,
                                                                  target: self,
                                                                  action: nil),
                                                  UIBarButtonItem(image: UIImage(systemName: "heart"),
                                                                  style: .done,
                                                                  target: self,
                                                                  action: nil)]
        }
    }
}
