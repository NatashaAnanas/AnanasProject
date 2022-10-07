//
//  InfoViewController.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 07.10.2022.
//

import UIKit
/// /// Контроллер с разделом "Для вас"
class InfoViewController: UIViewController {

    let nameOfItem: UILabel = {
            var label = UILabel(frame: CGRect(
                x: 20,
                y: 110,
                width: 400,
                height: 30))
            label.font = .boldSystemFont(ofSize: 16)
            label.textColor = .white
            return label
        }()
        
        lazy var photoOfItemImage: UIImageView = {
            var imageView = UIImageView(frame: CGRect(
                x: 50,
                y: 200,
                width: 300,
                height: 200))
            return imageView
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()

    }
    private func createUI() {
        view.backgroundColor = .black
        
        view.addSubview(photoOfItemImage)
        view.addSubview(nameOfItem)
    }

}
