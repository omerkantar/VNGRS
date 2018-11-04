//
//  UserDetailViewController.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit



class UserDetailViewController: BaseViewController, RouterDataSourceInjector, ViewModelInjector {
    
    // Table view
    @IBOutlet weak var tableView: QueerTableView!
    
    // View model
    typealias ViewModel = UserDetailViewModel
    var viewModel: UserDetailViewModel? = UserDetailViewModel()
    
    // MARK: - header
    lazy var component = UserDetailComponent.loadFromNib()
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        buildTableView()
    }
    
    // MARK: - RouterDataSourceInjector
    typealias DataSource = UserDetailDataSource
    func configuration(dataSource: UserDetailDataSource) {
        self.title = dataSource.title
        viewModel!.bind(dataSource: dataSource)
        viewModel!.componentView = self.component
    }
    
    // MARK: - TableView build
    func buildTableView() {
        tableView.build()
        tableView.register(types: [.collection])
        tableView.tableHeaderView = component
        tableView.add(models: [viewModel!.repository], cellType: .collection)
        tableView.reloadData()
    }
    

}
