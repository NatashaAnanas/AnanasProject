//
//  ViewControllerTwo.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 05.10.2022.
//

import UIKit
/// Контроллер Поиск
final class SearchViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let history = "Варианты запросов"
        static let historyLabels = ["  AirPods", "  AppleCare", "  Beats", "  Сравнените модели iPhone"]
        static let airPods = "  AirPods"
        static let appleCare = "  AppleCare"
        static let beats = "  Beats"
        static let iphoneModel = "  Сравнените модели iPhone"
        static let searchPlaceholder = "Поиск по продуктам и магазинам"
        static let watch = "Недавно просмотренные"
        static let searchImageSystemName = "magnifyingglass"
        static let macBlack = "Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let clock = "Спортивный ремешок Black Unity"
        static let macOrange = "Кожаный Чехол Incase Flat для MacBook Pro 16 дюймов"
        static let airpod = "Airpods pro 2"
        static let macBlackImageName = ["black1", "black2", "black3"]
        static let clockImageName =  ["clock1", "clock2"]
        static let macOrangeImageName = ["orange1", "orange2", "orange3"]
        static let airpodsImageName = ["air1"]
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
    
    private let blockOneView: UIView = {
        let view = UIView()
        view.tag = 0
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let blockTwoView: UIView = {
        let view = UIView()
        view.tag = 1
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let blockThreeView: UIView = {
        let view = UIView()
        view.tag = 2
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let blockFourView: UIView = {
        let view = UIView()
        view.tag = 3
        view.backgroundColor = UIColor(red: 28.0/255, green: 28.0/255, blue: 30.0/255, alpha: 1.0)
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.isUserInteractionEnabled = true
        return view
    }()
    
    private let macBlackImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.macBlackImageName.first ?? "")
        return image
    }()
    
    private let clockImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.clockImageName.first ?? "")
        return image
    }()
    
    private let macOrangeImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.macOrangeImageName.first ?? "")
        return image
    }()
    
    private let airpodsImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constants.airpodsImageName.first ?? "")
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
    
    private let airpodsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.airpod
        label.textColor = .white
        label.font = .systemFont(ofSize: 14)
        label.numberOfLines = 0
        return label
    }()
    
    private let scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .black
        scroll.contentSize = CGSize(width: 630, height: 140)
        scroll.indicatorStyle = .default
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    
    private lazy var createSeparator = makeSeparatorView(yCoordinate: 585)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        actions()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        createNavController()
    }
    
    // MARK: - Private Method
    private func createNavController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .black
    }
    
    private func createUI() {
        view.backgroundColor = .black

        scrollView.frame = CGRect(x: 0, y: 280, width: view.bounds.width, height: 190)
        view.addSubview(scrollView)
        
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

        blockOneView.frame = CGRect(x: 20, y: 0, width: 140, height: 190)
        scrollView.addSubview(blockOneView)
        
        blockTwoView.frame = CGRect(x: 170, y: 0, width: 140, height: 190)
        scrollView.addSubview(blockTwoView)
        
        blockThreeView.frame = CGRect(x: 320, y: 0, width: 140, height: 190)
        scrollView.addSubview(blockThreeView)
        
        blockFourView.frame = CGRect(x: 470, y: 0, width: 140, height: 190)
        scrollView.addSubview(blockFourView)
        
        macBlackImageView.frame = CGRect(x: 22, y: 35, width: 100, height: 70)
        blockOneView.addSubview(macBlackImageView)
        
        clockImageView.frame = CGRect(x: 35, y: 20, width: 70, height: 100)
        blockTwoView.addSubview(clockImageView)
        
        macOrangeImageView.frame = CGRect(x: 22, y: 15, width: 100, height: 120)
        blockThreeView.addSubview(macOrangeImageView)
        
        airpodsImageView.frame = CGRect(x: 22, y: 15, width: 100, height: 120)
        blockFourView.addSubview(airpodsImageView)
        
        macBlackLabel.frame = CGRect(x: 10, y: 115, width: 120, height: 60)
        blockOneView.addSubview(macBlackLabel)
        
        clockLabel.frame = CGRect(x: 10, y: 115, width: 120, height: 60)
        blockTwoView.addSubview(clockLabel)
        
        macOrangeLabel.frame = CGRect(x: 10, y: 115, width: 120, height: 60)
        blockThreeView.addSubview(macOrangeLabel)
        
        airpodsLabel.frame = CGRect(x: 10, y: 115, width: 120, height: 60)
        blockFourView.addSubview(airpodsLabel)
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        makeRequestOptions(yCoordinateConstant: 50)
    }
    
    private func actions() {
        
        blockOneView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                 action: #selector(goToAction(sender: ))))
        blockTwoView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                 action: #selector(goToAction(sender: ))))
        blockThreeView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                   action: #selector(goToAction(sender: ))))
        blockFourView.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                                  action: #selector(goToAction(sender: ))))
    }
    
    @objc private func goToAction(sender: UITapGestureRecognizer) {
        
        let infoVC = InfoViewController()
        
        switch sender.view?.tag {
        case 0:
            infoVC.infoLabel.text = macBlackLabel.text
            infoVC.firstImageView.image = UIImage(named: Constants.macBlackImageName.first ?? "")
            infoVC.secondImageView.image = UIImage(named: Constants.macBlackImageName[1])
            infoVC.thirdImageView.image = UIImage(named: Constants.macBlackImageName[2])
            infoVC.smallInfoLabel.text = macBlackLabel.text
            infoVC.count = Constants.macBlackImageName.count
            infoVC.imageScrollView.tag = 0
        case 1:
            infoVC.infoLabel.text = clockLabel.text
            infoVC.firstImageView.image = UIImage(named: Constants.clockImageName.first ?? "")
            infoVC.secondImageView.image = UIImage(named: Constants.clockImageName.last ?? "")
            infoVC.smallInfoLabel.text = clockLabel.text
            infoVC.count = Constants.clockImageName.count
            infoVC.imageScrollView.tag = 1
        case 2:
            infoVC.infoLabel.text = macOrangeLabel.text
            infoVC.firstImageView.image = UIImage(named: Constants.macOrangeImageName.first ?? "")
            infoVC.secondImageView.image = UIImage(named: Constants.macOrangeImageName[1])
            infoVC.thirdImageView.image = UIImage(named: Constants.macOrangeImageName.last ?? "")
            infoVC.smallInfoLabel.text = macOrangeLabel.text
            infoVC.count = Constants.macOrangeImageName.count
            infoVC.imageScrollView.tag = 2
        case 3:
            infoVC.infoLabel.text = airpodsLabel.text
            infoVC.firstImageView.image = UIImage(named: Constants.airpodsImageName.first ?? "")
            infoVC.smallInfoLabel.text = airpodsLabel.text
            infoVC.count = Constants.airpodsImageName.count
            infoVC.imageScrollView.tag = 3
        default:
            break
        }
        navigationController?.pushViewController(infoVC, animated: true)
    }
}

private extension SearchViewController {
    
    func makeSeparatorView(yCoordinate: Int) -> UIView {
        let view = UIView()
        view.backgroundColor = .tertiaryLabel
        view.frame = CGRect(x: 19, y: yCoordinate, width: 376, height: 2)
        return view
    }
    
    func makeRequestOptions(yCoordinateConstant: Int) {
        var yCoordinateSeparatorView = 585
        for _ in 1...Constants.historyLabels.count {
            let separatorView = makeSeparatorView(yCoordinate: yCoordinateSeparatorView)
            yCoordinateSeparatorView += yCoordinateConstant
            view.addSubview(separatorView)
        }
    }
}
