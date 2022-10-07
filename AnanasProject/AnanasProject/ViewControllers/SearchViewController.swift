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
        static let clean = "Очистить"
    }
    
    // MARK: - Visual Components
    
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
        search.searchBar.placeholder = Constants.searchPlaceholder
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
        button.setTitle(Constants.clean, for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .systemFont(ofSize: 18)
        return button
    }()
    
    private let blokOneView: UIView = {
        let view = UIView()
        view.tag = 0
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        return view
    }()
    
    private let blokTwoView: UIView = {
        let view = UIView()
        view.tag = 1
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        return view
    }()
    
    private let blokThreeView: UIView = {
        let view = UIView()
        view.tag = 2
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        return view
    }()
    
    private let macBlackImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.macBlackImageName)
        return image
    }()
    
    private let clockImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.clockImageName)
        return image
    }()
    
    private let macOrangeImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.macOrangeImageName)
        return image
    }()
    
    private let macBlackLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.macBlack
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private let clockLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.clock
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private let macOrangeLabel: UILabel = {
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
        actions()
    }
    
    // MARK: - Private Method
    
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
        
        blokOneView.frame = CGRect(x: 20, y: 280, width: 140, height: 190)
        view.addSubview(blokOneView)
        
        blokTwoView.frame = CGRect(x: 170, y: 280, width: 140, height: 190)
        view.addSubview(blokTwoView)
        
        blokThreeView.frame = CGRect(x: 320, y: 280, width: 140, height: 190)
        view.addSubview(blokThreeView)
        
        macBlackImageView.frame = CGRect(x: 22, y: 35, width: 100, height: 70)
        blokOneView.addSubview(macBlackImageView)
        
        clockImageView.frame = CGRect(x: 35, y: 20, width: 70, height: 100)
        blokTwoView.addSubview(clockImageView)
        
        macOrangeImageView.frame = CGRect(x: 22, y: 15, width: 100, height: 120)
        blokThreeView.addSubview(macOrangeImageView)
        
        macBlackLabel.frame = CGRect(x: 10, y: 115, width: 120, height: 60)
        blokOneView.addSubview(macBlackLabel)
        
        clockLabel.frame = CGRect(x: 10, y: 115, width: 120, height: 60)
        blokTwoView.addSubview(clockLabel)
        
        macOrangeLabel.frame = CGRect(x: 10, y: 115, width: 120, height: 60)
        blokThreeView.addSubview(macOrangeLabel)
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        blokOneView.isUserInteractionEnabled = true
        blokTwoView.isUserInteractionEnabled = true
        blokThreeView.isUserInteractionEnabled = true
        
    }
    
    private func actions() {
        
        blokOneView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                action: #selector(goToAction(sender: ))))
        blokTwoView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                action: #selector(goToAction(sender: ))))
        blokThreeView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                  action: #selector(goToAction(sender: ))))
    }
    
    @objc private func goToAction(sender: UITapGestureRecognizer) {
        
        let infoVC = InfoViewController()
        
        switch sender.view?.tag {
        case 0:
            infoVC.infoLabel.text = macBlackLabel.text
            infoVC.photoImageView.image = UIImage(named: Constants.macBlackImageName)
        case 1:
            infoVC.infoLabel.text = clockLabel.text
            infoVC.photoImageView.image = UIImage(named: Constants.clockImageName)
        case 2:
            infoVC.infoLabel.text = macOrangeLabel.text
            infoVC.photoImageView.image = UIImage(named: Constants.macOrangeImageName)
        default:
            break
        }
        navigationController?.pushViewController(infoVC, animated: true)
    }
}
