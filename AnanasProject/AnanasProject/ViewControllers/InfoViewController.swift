//
//  InfoViewController.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 07.10.2022.
//

import UIKit
/// Контроллер с разделом "Для вас"
class InfoViewController: UIViewController {
    
    // MARK: - Visual Components
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    let photoImageView: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    // MARK: - Private Method
    private func createUI() {
        view.backgroundColor = .black
        
        photoImageView.frame = CGRect(x: 50, y: 200, width: 300, height: 200)
        view.addSubview(photoImageView)
        
        infoLabel.frame = CGRect(x: 20, y: 110, width: 400, height: 30)
        view.addSubview(infoLabel)
    }
}
