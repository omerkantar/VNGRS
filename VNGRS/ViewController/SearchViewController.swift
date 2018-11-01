//
//  SearchViewController.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import RxSwift

class SearchViewController: BaseViewController {

    @IBOutlet weak var tableView: QueerTableView!
    
    
    var viewModel = SearchViewModel() 
    
    private lazy var searchComponent = SearchComponent.loadFromNib()
    
    private lazy var disposeBag = DisposeBag()

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        buildTableView()
        addObservers()
    }
    
    // MARK: - Navigation bar
    override func isShowingNavigationBar() -> Bool {
        return false
    }
    
    func buildTableView() {
        tableView.build()
        tableView.tableHeaderView = searchComponent
        tableView.register(types: [.keyword, .repository])
    }
    
    func addObservers() {
        
        // TODO: - search component text field dinlenecek
        viewModel.search(keyword: "vngrs")
        
        viewModel.repositories.asObservable().subscribe { [weak self] (list) in
            
            if let count = list.element?.count, count > 0 {
                // eger varsa bu gozukecek
                self?.tableView.add(models: self?.viewModel.repositories.value, cellType: .repository)
            } else {
                // yoksa son aranan eleman
                self?.tableView.add(models: SearchManager.shared.keywords, cellType: .keyword)
            }
            
            self?.tableView.reloadData()
        }.disposed(by: disposeBag)
    }

    
    // MARK: - Load data
    func loadData() {
        
    }
    
    

}
