//
//  ViewControllerTwo.swift
//  AnanasProject
//
//  Created by Анастасия Козлова on 05.10.2022.
//

import UIKit
/// Контроллер Поиск
class SearchViewController: UIViewController, UISearchResultsUpdating {
    
    let searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Привет"
        return search
    }()
    
    let label: UILabel = {
        let label = UILabel()
        label.text = "Недавно просмотренные"
        label.font = .systemFont(ofSize: 25)
        label.textColor = .white
        return label
    }()
    
    let cleanButton: UIButton = {
        let button = UIButton()
        button.setTitle("Очистить", for: .normal)
        button.setTitleColor(UIColor.blue, for: .normal)
//        button.titleLabel?.textColor = .blue
//        button.titleLabel?.text = "Очистить"
        button.titleLabel?.textAlignment = .center
        button.titleLabel?.font = .systemFont(ofSize: 20)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        createUI()
    }
    
    private func createUI() {
        view.backgroundColor = .black
        
        label.frame = CGRect(x: 10, y: 250, width: 300, height: 40)
        view.addSubview(label)
        
        cleanButton.frame = CGRect(x: 310, y: 250, width: 100, height: 40)
        view.addSubview(cleanButton)
        
        searchController.searchResultsUpdater = self
        navigationItem.searchController = searchController
        definesPresentationContext = true
    }
}

extension SearchViewController: UISearchControllerDelegate {
    
}
