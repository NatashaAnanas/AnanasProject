//
//  ViewControllerTwo.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 05.10.2022.
//

import UIKit
/// Контроллер Поиск
class SearchViewController: UIViewController {
    
    private enum Constants {
        static let history = "Варианты запросов"
        static let airPods = "  AirPods"
        static let appleCare = "  AppleCare"
        static let beats = "  Beats"
        static let iphoneModel = "  Сравнените модели iPhone"
        static let searchPlaceholder = "Поиск"
        static let watch = "Недавно просмотренные"
        static let searchImageSystemName = "magnifyingglass"
        static let macBlack = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let clock = "Спортивный ремешок Black Unity"
        static let macOrange = "Кожаный Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let macBlackImageName = "чехол"
        static let clockImageName = "4"
        static let macOrangeImageName = "2"
    }
    
    private let historyLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.history
        label.textColor = .white
        label.font = .systemFont(ofSize: 25)
        return label
    }()
    
    private let airPodsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Constants.airPods, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 21)
        let image = UIImage(systemName: Constants.searchImageSystemName)
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let appleCareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Constants.appleCare, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 21)
        let image = UIImage(systemName: Constants.searchImageSystemName)
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let beatsButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Constants.beats, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 21)
        let image = UIImage(systemName: Constants.searchImageSystemName)
        button.setImage(image, for: .normal)
        return button
    }()
    
    private let iphoneModelButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Constants.iphoneModel, for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 21)
        let image = UIImage(systemName: Constants.searchImageSystemName)
        button.setImage(image, for: .normal)
        return button
    }()
    
    private var searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = Constants.searchPlaceholder // тут текст
        return search
    }()
    
    private let watchlabel: UILabel = {
        let label = UILabel()
        label.text = Constants.watch
        label.font = .systemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    
    private let cleanButton: UIButton = {
        let button = UIButton()
        button.setTitle("Очистить", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .systemFont(ofSize: 18)
        return button
    }()
    
//    private let searchImage: UIImage = {
//        let image = UIImage(systemName: Constants.searchImageName))
//        return image
//    }()
    
    private let lupaAirPodsImage: UIImageView = {
            var imageView = UIImageView(frame: CGRect(
                x: 23,
                y: 585,
                width: 18,
                height: 18))
        imageView.image = UIImage()
            imageView.tintColor = .systemGray
            imageView.contentMode = .scaleAspectFit
            return imageView
        }()
    
    private let blokViewOne: UIView = {
        let view = UIView()
        view.tag = 0
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        return view
    }()
    
    private let blokViewTwo: UIView = {
        let view = UIView()
        view.tag = 1
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        return view
    }()
    
    private let blokViewThree: UIView = {
        let view = UIView()
        view.tag = 2
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        return view
    }()
    
    let macBlackImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "чехол")
        return image
    }()
    
    let clockImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "4")
        return image
    }()
    
    let macOrangeImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "2")
        return image
    }()
    
    let macBlackLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.macBlack
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    let clockLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.clock
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    let macOrangeLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.macOrange
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    private func createUI() {
        view.backgroundColor = .black
        
        watchlabel.frame = CGRect(x: 20, y: 230, width: 300, height: 40)
        view.addSubview(watchlabel)
        
        cleanButton.frame = CGRect(x: 310, y: 230, width: 100, height: 40)
        view.addSubview(cleanButton)
        
        historyLabel.frame = CGRect(x: 20, y: 500, width: 300, height: 30)
        view.addSubview(historyLabel)
        
        airPodsButton.frame = CGRect(x: 20, y: 550, width: 105, height: 30)
        view.addSubview(airPodsButton)
        
        appleCareButton.frame = CGRect(x: 20, y: 600, width: 130, height: 30)
        view.addSubview(appleCareButton)
        
        beatsButton.frame = CGRect(x: 20, y: 650, width: 90, height: 30)
        view.addSubview(beatsButton)
        
        iphoneModelButton.frame = CGRect(x: 20, y: 700, width: 300, height: 30)
        view.addSubview(iphoneModelButton)
        
        blokViewOne.frame = CGRect(x: 20, y: 280, width: 140, height: 190)
        view.addSubview(blokViewOne)
        
        blokViewTwo.frame = CGRect(x: 170, y: 280, width: 140, height: 190)
        view.addSubview(blokViewTwo)
        
        blokViewThree.frame = CGRect(x: 320, y: 280, width: 140, height: 190)
        view.addSubview(blokViewThree)
        
        macBlackImage.frame = CGRect(x: 22, y: 35, width: 100, height: 70)
        blokViewOne.addSubview(macBlackImage)
        
        clockImage.frame = CGRect(x: 35, y: 20, width: 70, height: 100)
        blokViewTwo.addSubview(clockImage)
        
        macOrangeImage.frame = CGRect(x: 22, y: 15, width: 100, height: 120)
        blokViewThree.addSubview(macOrangeImage)
        
        macBlackLabel.frame = CGRect(x: 10, y: 115, width: 120, height: 60)
        blokViewOne.addSubview(macBlackLabel)
        
        clockLabel.frame = CGRect(x: 10, y: 115, width: 120, height: 60)
        blokViewTwo.addSubview(clockLabel)
        
        macOrangeLabel.frame = CGRect(x: 10, y: 115, width: 120, height: 60)
        blokViewThree.addSubview(macOrangeLabel)
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        blokViewOne.isUserInteractionEnabled = true
        blokViewTwo.isUserInteractionEnabled = true
        blokViewThree.isUserInteractionEnabled = true
            
        blokViewOne.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToAction(sender: ))))
        blokViewTwo.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goToAction(sender: ))))
        blokViewThree.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                  action: #selector(goToAction(sender: ))))
    }
    
    @objc private func goToAction(sender: UITapGestureRecognizer) {

        let infoVC = InfoViewController()
        
        switch sender.view?.tag {
        case 0:
            infoVC.nameOfItem.text = macBlackLabel.text
            infoVC.photoOfItemImage.image = UIImage(named: Constants.macBlackImageName)
        case 1:
            infoVC.nameOfItem.text = clockLabel.text
            infoVC.photoOfItemImage.image = UIImage(named: Constants.clockImageName)
        case 2:
            infoVC.nameOfItem.text = macOrangeLabel.text
            infoVC.photoOfItemImage.image = UIImage(named: Constants.macOrangeImageName)
        default:
            break
        }
        navigationController?.pushViewController(infoVC, animated: true)
    }
}
