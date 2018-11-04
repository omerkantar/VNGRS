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
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+0.5) {
            self.searchComponent.textField.becomeFirstResponder()
        }
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
        
        searchComponent.textField.rx.controlEvent([.editingDidEndOnExit]).subscribe { [weak self] text in
            self?.viewModel.search(keyword: self?.searchComponent.textField.text)
            
        }.disposed(by: disposeBag)
        // table view bind edilmesi
        viewModel.repositories.asObservable().subscribe { [weak self] (list) in
            
            self?.tableView.rowModelOfCellType.removeAll()
            
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

    
    
    

}
