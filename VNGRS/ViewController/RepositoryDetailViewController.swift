//
//  RepositoryDetailViewController.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit


class RepositoryDetailViewController: BaseViewController, RouterDataSourceInjector, ViewModelInjector {
    
    
    

    @IBOutlet weak var component: RepositoryComponent!

    // MARK: - ViewModelInjector
    typealias ViewModel = RepositoryDetailViewModel
    var viewModel: RepositoryDetailViewModel?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        DispatchQueue.main.async {
            if let vm = self.viewModel {
                self.component.configuration(model: vm)
            }
        }
    }
    
    // MARK: - RouterDataSourceInjector
    typealias DataSource = RepositoryDetailRouterData
    func configuration(dataSource: RepositoryDetailRouterData) {
        viewModel = RepositoryDetailViewModel(model: dataSource.model)
    }


}
