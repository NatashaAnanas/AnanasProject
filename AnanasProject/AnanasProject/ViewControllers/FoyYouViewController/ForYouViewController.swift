//
//  FotYouViewControllerOne.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 05.10.2022.
//

import UIKit
/// Контроллер с разделом "Для вас"
final class ForYouViewController: UIViewController {
    
    // MARK: - Constant
    
    private enum Constant {
        static let new = "Вот что нового"
        static let oderSent = "Ваш заказ отправлен"
        static let infoOder = "1 товар, доставка заавтра"
        static let processed = "Обрабатывается"
        static let sent = "Отправленно"
        static let delivered = "Доставленно"
        static let recommended = "Рекомендуется вам"
        static let getNews = "Получайте новости о своем заказе режиме реального времени."
        static let getNotifications = "Включите уведомления, чтобы получать новости о своем заказе"
        static let devices = "Ваши устройства"
        static let showAll = "Показать все"
        static let appBage = "app.badge"
        static let icon = "иконка"
        static let air = "air1"
        static let userDefaultsAvatar = "ava"
    }
    
    private struct Const {
        static let ImageSizeForLargeState: CGFloat = 40
        static let ImageRightMargin: CGFloat = 16
        static let ImageBottomMarginForLargeState: CGFloat = 12
        static let ImageBottomMarginForSmallState: CGFloat = 6
        static let ImageSizeForSmallState: CGFloat = 32
        static let NavBarHeightSmallState: CGFloat = 44
        static let NavBarHeightLargeState: CGFloat = 96.5
    }
    
    // MARK: - Visual Components
    
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.backgroundColor = .white
        scroll.contentSize = CGSize(width: self.view.bounds.width, height: 1000)
        return scroll
    }()
    
    private let newLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.new
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 35)
        label.textAlignment = .left
        return label
    }()
    
    private let recommendedLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.recommended
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 30)
        label.textAlignment = .left
        return label
    }()
    
    private let getNewsLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.getNews
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let devicesLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.devices
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .left
        return label
    }()
    
    private let showAllLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.showAll
        label.textColor = .systemBlue
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .right
        return label
    }()
    
    private let getNotificationsLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.getNotifications
        label.textColor = .tertiaryLabel
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    let infoView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.backgroundColor = .white
        
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 2.5, height: 2.5)
        view.layer.shadowRadius = 10.0
        view.layer.shadowOpacity = 0.5
        view.layer.masksToBounds = false
        view.layer.cornerRadius = 10
        
        let processed = UILabel()
        processed.text = Constant.processed
        processed.textColor = .black
        processed.font = .boldSystemFont(ofSize: 13)
        processed.frame = CGRect(x: 10, y: 130, width: 120, height: 20)
        
        let sent = UILabel()
        sent.text = Constant.sent
        sent.textColor = .black
        sent.font = .boldSystemFont(ofSize: 13)
        sent.frame = CGRect(x: 140, y: 130, width: 110, height: 20)
        
        let deliver = UILabel()
        deliver.text = Constant.delivered
        deliver.textColor = .black
        deliver.font = .boldSystemFont(ofSize: 13)
        deliver.frame = CGRect(x: 250, y: 130, width: 110, height: 20)
        
        view.addSubview(processed)
        view.addSubview(sent)
        view.addSubview(deliver)
        return view
    }()
    
    private let separateView: UIView = {
        let view = UIView()
        view.backgroundColor = .tertiaryLabel
        return view
    }()
    
    private let airPodsImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constant.air)
        return image
    }()
    
    private let oderSentLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.oderSent
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        return label
    }()
    
    private let infoOderLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.infoOder
        label.textColor = .tertiaryLabel
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    private let infoProgressView: UIProgressView = {
        let progress = UIProgressView()
        progress.progressTintColor = .green
        progress.trackTintColor = .tertiaryLabel
        progress.setProgress(0.5, animated: true)
        return progress
    }()
    
    private let customView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let appBageImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: Constant.appBage)
        image.tintColor = .red
        return image
    }()
    
    lazy var iconImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: Constant.icon)
        image.layer.cornerRadius = Const.ImageSizeForLargeState / 2
        image.clipsToBounds = true
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(iconImageViewAction))
        image.addGestureRecognizer(tapGestureRecognizer)
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private lazy var createSeparator = makeSeparatorView(yCoordinate: 0)
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
        setupUI()
        loadFromUserDefaults()
    }
    
    // MARK: - Private Method
    
    private func loadFromUserDefaults() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: Constant.userDefaultsAvatar) as? Data else { return }
        guard let image = UIImage(data: data) else { return }
        iconImageView.image = image
    }
    
    private func createUI() {
        view.backgroundColor = .white
        title = "Для вас"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "",
                                                           style: .done,
                                                           target: self,
                                                           action: nil)
        
        appBageImageView.frame = CGRect(x: 30, y: 380, width: 35, height: 35)
        scrollView.addSubview(appBageImageView)
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        view.addSubview(scrollView)
        
        separateView.frame = CGRect(x: 0, y: 110, width: view.bounds.width - 40, height: 1)
        infoView.addSubview(separateView)
        
        infoView.frame = CGRect(x: 0, y: 90, width: view.bounds.width - 40, height: 170)
        infoView.center.x = view.center.x
        scrollView.addSubview(infoView)
        
        newLabel.frame = CGRect(x: 20, y: 20, width: 250, height: 50)
        scrollView.addSubview(newLabel)
        
        recommendedLabel.frame = CGRect(x: 20, y: 310, width: 350, height: 50)
        scrollView.addSubview(recommendedLabel)
        
        getNewsLabel.frame = CGRect(x: 80, y: 360, width: 260, height: 100)
        scrollView.addSubview(getNewsLabel)
        
        getNotificationsLabel.frame = CGRect(x: 80, y: 420, width: 330, height: 100)
        scrollView.addSubview(getNotificationsLabel)
        
        devicesLabel.frame = CGRect(x: 20, y: 560, width: 300, height: 50)
        scrollView.addSubview(devicesLabel)
        
        showAllLabel.frame = CGRect(x: 20, y: 575, width: view.bounds.width - 40, height: 30)
        scrollView.addSubview(showAllLabel)
        
        airPodsImageView.frame = CGRect(x: 15, y: 10, width: 80, height: 80)
        infoView.addSubview(airPodsImageView)
        
        oderSentLabel.frame = CGRect(x: 100, y: 30, width: 200, height: 20)
        infoView.addSubview(oderSentLabel)
        
        infoOderLabel.frame = CGRect(x: 100, y: 55, width: 200, height: 20)
        infoView.addSubview(infoOderLabel)
        
        infoProgressView.frame = CGRect(x: 10, y: 120, width: infoView.bounds.width - 20, height: 40)
        infoView.addSubview(infoProgressView)
        
        makeRequestOptions(yCoordinateConstant: 520)
    }
    
    private func setupUI() {
        
        guard let navigationBar = self.navigationController?.navigationBar else { return }
        navigationBar.addSubview(iconImageView)
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor,
                                                 constant: -Const.ImageRightMargin),
            iconImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor,
                                                  constant: -Const.ImageBottomMarginForLargeState),
            iconImageView.heightAnchor.constraint(equalToConstant: Const.ImageSizeForLargeState),
            iconImageView.widthAnchor.constraint(equalTo: iconImageView.heightAnchor)
        ])
    }
    
    private func moveAndResizeImage(for height: CGFloat) {
        let coeff: CGFloat = {
            let delta = height - Const.NavBarHeightSmallState
            let heightDifferenceBetweenStates = (Const.NavBarHeightLargeState - Const.NavBarHeightSmallState)
            return delta / heightDifferenceBetweenStates
        }()
        
        let factor = Const.ImageSizeForSmallState / Const.ImageSizeForLargeState
        
        let scale: CGFloat = {
            let sizeAddendumFactor = coeff * (1.0 - factor)
            return min(1.0, sizeAddendumFactor + factor)
        }()
        
        let sizeDiff = Const.ImageSizeForLargeState * (1.0 - factor)
        
        let yTranslation: CGFloat = {
            let maxYTranslation = Const.ImageBottomMarginForLargeState - Const.ImageBottomMarginForSmallState + sizeDiff
            return max(0, min(maxYTranslation,
                              (maxYTranslation - coeff * (Const.ImageBottomMarginForSmallState + sizeDiff))))
        }()
        
        let xTranslation = max(0, sizeDiff - coeff * sizeDiff)
        
        iconImageView.transform = CGAffineTransform.identity
            .scaledBy(x: scale, y: scale)
            .translatedBy(x: xTranslation, y: yTranslation)
    }
    
    @objc private func iconImageViewAction() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true)
    }
    
    func saveUserDefaults(image: Data) {
        let userDefaults = UserDefaults.standard
        userDefaults.setValue(image, forKey: Constant.userDefaultsAvatar)
    }
}

private extension ForYouViewController {
    
    func makeSeparatorView(yCoordinate: Int) -> UIView {
        let view = UIView()
        view.backgroundColor = .tertiaryLabel
        view.frame = CGRect(x: 20, y: yCoordinate, width: 370, height: 1)
        return view
    }
    
    func makeRequestOptions(yCoordinateConstant: Int) {
        var yCoordinateSeparatorView = 0
        for _ in 1...2 {
            let separatorView = makeSeparatorView(yCoordinate: yCoordinateSeparatorView)
            yCoordinateSeparatorView += yCoordinateConstant
            scrollView.addSubview(separatorView)
        }
    }
}
