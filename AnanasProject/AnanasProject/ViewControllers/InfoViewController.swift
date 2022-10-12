//
//  InfoViewController.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 07.10.2022.
//

import UIKit
/// Контроллер с разделом "Для вас"
final class InfoViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constant {
        static let addToBag = "Добавить в корзину"
        static let infoTextOne = "Заказ сегодня в течении для, доставка:"
        static let infoTextTwo = "Чт 25 фев - Бесплатно"
        static let infoTextThree = "Варианты доставки для местоположкния: 115533"
        static let connectWith = "Совместимо с MacBook Pro - Евгений"
        static let price = "3 990.00 руб"
        static let boxSystemName = "cube.box"
        static let yes = "yes"
        static let heart = "heart"
        static let square = "square.and.arrow.up"
        static let blackMacUrl = "https://re-store.ru/catalog/MFMBPRO1621BLK/"
        static let clockUrl = "https://re-store.ru/catalog/MJ4V3ZM-A/"
        static let orangeMacUrl = "https://re-store.ru/catalog/MFMBPRO1320OR/"
        static let airPodsUrl = "https://re-store.ru/catalog/MLWK3/"
        static let appStoreUrl = "https://re-store.ru"
        
    }
    
    // MARK: - Visual Components
    
    private let boxImageView: UIImageView = {
        let image = UIImageView(image: UIImage(systemName: Constant.boxSystemName))
        image.tintColor = .tertiaryLabel
        return image
    }()
    
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
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    let firstImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let secondImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let thirdImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let yesImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: Constant.yes)
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let smallInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    private let connectInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.textAlignment = .center
        label.text = Constant.connectWith
        label.labelColorChange(For: Constant.connectWith as NSString,
                               into: .blue,
                               from: 13,
                               to: 21)
        label.textAlignment = .center
        return label
    }()
    
    private let blackButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .darkGray
        button.tag = 1
        return button
    }()
    
    private let whiteButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 20
        button.backgroundColor = .lightGray
        button.tag = 0
        return button
    }()
    
    private let borderButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 24
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.layer.borderWidth = 2
        return button
    }()
    
    lazy var imageScrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize = CGSize(width: Int(view.bounds.width) * self.count, height: 240)
        scroll.isPagingEnabled = true
        scroll.indicatorStyle = .white
        scroll.horizontalScrollIndicatorInsets = UIEdgeInsets(top: 100, left: 0, bottom: 10, right: 0)
        return scroll
    }()
    
    private let firstTextLabel: UILabel = {
        let text = UILabel()
        text.text = Constant.infoTextOne
        text.textColor = .white
        text.font = .boldSystemFont(ofSize: 13)
        text.textAlignment = .left
        return text
    }()
    
    private let secondTextLabel: UILabel = {
        let text = UILabel()
        text.text = Constant.infoTextTwo
        text.font = .systemFont(ofSize: 13)
        text.textColor = .lightGray
        text.textAlignment = .left
        return text
    }()
    
    private let thirdTextLabel: UILabel = {
        let text = UILabel()
        text.text = Constant.infoTextThree
        text.font = .systemFont(ofSize: 13)
        text.textColor = .systemBlue
        text.textAlignment = .left
        return text
    }()
    
    private let priceLabel: UILabel = {
        let text = UILabel()
        text.text = Constant.price
        text.font = .systemFont(ofSize: 16)
        text.textColor = .lightGray
        text.textAlignment = .center
        return text
    }()
    
    private let pdfButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    // MARK: - Public Properties
    
    var count = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        addItems()
        actions()
    }
    
    // MARK: - Private Method
    
    private func createUI() {
        view.backgroundColor = .black
        
        imageScrollView.frame = CGRect(x: 0, y: 200, width: view.bounds.width, height: 240)
        view.addSubview(imageScrollView)
        
        firstImageView.frame = CGRect(x: 0, y: 0, width: 300, height: 190)
        firstImageView.center.x = imageScrollView.center.x
        imageScrollView.addSubview(firstImageView)
        
        secondImageView.frame = CGRect(x: 0, y: 0, width: 300, height: 190)
        secondImageView.center.x = firstImageView.center.x + view.bounds.width
        imageScrollView.addSubview(secondImageView)
        
        thirdImageView.frame = CGRect(x: 0, y: 0, width: 300, height: 190)
        thirdImageView.center.x = secondImageView.center.x + view.bounds.width
        imageScrollView.addSubview(thirdImageView)
        
        infoLabel.frame = CGRect(x: 0, y: 100, width: 400, height: 50)
        infoLabel.center.x = view.center.x
        view.addSubview(infoLabel)
        
        addBagButton.frame = CGRect(x: 0, y: 660, width: 340, height: 35)
        addBagButton.center.x = view.center.x
        view.addSubview(addBagButton)
        
        smallInfoLabel.frame = CGRect(x: 0, y: 450, width: 350, height: 30)
        smallInfoLabel.center.x = view.center.x
        view.addSubview(smallInfoLabel)
        
        whiteButton.frame = CGRect(x: 160, y: 530, width: 40, height: 40)
        view.addSubview(whiteButton)
        
        blackButton.frame = CGRect(x: 210, y: 530, width: 40, height: 40)
        view.addSubview(blackButton)
        
        connectInfoLabel.frame = CGRect(x: 0, y: 600, width: 300, height: 30)
        connectInfoLabel.center.x = view.center.x
        view.addSubview(connectInfoLabel)
        
        yesImageView.frame = CGRect(x: 50, y: 605, width: 20, height: 20)
        view.addSubview(yesImageView)
        
        firstTextLabel.frame = CGRect(x: 60, y: 730, width: 300, height: 30)
        view.addSubview(firstTextLabel)
        
        secondTextLabel.frame = CGRect(x: 60, y: 750, width: 300, height: 20)
        view.addSubview(secondTextLabel)
        
        thirdTextLabel.frame = CGRect(x: 60, y: 765, width: 350, height: 20)
        view.addSubview(thirdTextLabel)
        
        priceLabel.frame = CGRect(x: 0, y: 140, width: 100, height: 30)
        priceLabel.center.x = view.center.x
        view.addSubview(priceLabel)
        
        borderButton.frame = CGRect(x: 0, y: 0, width: 48, height: 48)
        
        boxImageView.frame = CGRect(x: 30, y: 740, width: 20, height: 20)
        view.addSubview(boxImageView)
        
        pdfButton.frame = CGRect(x: 50, y: 740, width: 370, height: 40)
        view.addSubview(pdfButton)
        
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    private func actions() {
        
        blackButton.addTarget(self, action: #selector(chouseColorAction(sender: )), for: .touchUpInside)
        
        whiteButton.addTarget(self, action: #selector(chouseColorAction(sender: )), for: .touchUpInside)
        
        imageScrollView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                    action: #selector(imageScrollViewAction(sender: ))))
        pdfButton.addTarget(self, action: #selector(pdfButtonAction(sender: )), for: .touchUpInside)
    }
    
    private func addItems() {
        navigationItem.rightBarButtonItems = [UIBarButtonItem(image: UIImage(systemName: Constant.heart),
                                                              style: .done,
                                                              target: self,
                                                              action: nil),
                                              UIBarButtonItem(image: UIImage(systemName: Constant.square),
                                                              style: .done,
                                                              target: self,
                                                              action: nil)]
    }
    
    @objc private func imageScrollViewAction(sender: UIScrollView) {
        
        let wkController = WKWebViewController()
        
        switch imageScrollView.tag {
        case 0:
            wkController.url = Constant.blackMacUrl
        case 1:
            wkController.url = Constant.clockUrl
        case 2:
            wkController.url = Constant.orangeMacUrl
        case 3:
            wkController.url = Constant.airPodsUrl
        default:
            wkController.url = Constant.appStoreUrl
        }
        navigationController?.modalPresentationStyle = .pageSheet
        present(wkController, animated: true)
    }
    
    @objc private func chouseColorAction(sender: UIButton) {
        switch sender.tag {
        case 0:
            borderButton.center = whiteButton.center
            view.addSubview(borderButton)
        case 1:
            borderButton.center = blackButton.center
            view.addSubview(borderButton)
        default:
            break
        }
    }
    
    @objc private func pdfButtonAction(sender: UIButton) {
        
        let pdfController = PdfViewController()
        navigationController?.modalPresentationStyle = .formSheet
        present(pdfController, animated: true)
    }
}
