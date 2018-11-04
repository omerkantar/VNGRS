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
    @IBOutlet weak var bottomBar: RepositoryDetailBottomBar!
    
    
    // MARK: - ViewModelInjector
    typealias ViewModel = RepositoryDetailViewModel
    var viewModel: RepositoryDetailViewModel?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        if let vm = viewModel {
            self.component.build(viewModel: vm)
            self.bottomBar.configuration(avatar: vm.avatarViewModel, websiteUrl: vm.model.homepageUrl)
        }
    }
    
    // MARK: - RouterDataSourceInjector
    typealias DataSource = RepositoryDetailRouterData
    func configuration(dataSource: RepositoryDetailRouterData) {
        self.viewModel = RepositoryDetailViewModel(model: dataSource.model)
    }

    // MARK: - Navigation bar
    override func isShowingNavigationBar() -> Bool {
        return true
    }

}
