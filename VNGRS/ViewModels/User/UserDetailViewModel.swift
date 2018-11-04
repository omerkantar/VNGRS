//
//  UserDetailViewModel.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit


// MARK: - CollectionTableViewDataSource

class UserDetailViewModel: ViewModelDataSourceInjector, ViewModelServiceInjector {
    
    
    var title: String?
    var model: UserModel?
    
    var component: UserDetailComponentViewModel?
    var repository = RepositoryCollectionTableCellModel()
    var repositories: [RepositoryCellModel]?
    
    // Data source gelip bind edecek
    typealias DataSource = UserDetailDataSource
    func bind(dataSource: UserDetailDataSource) {
        // load data
        self.title = dataSource.title
        getUserModel(title: dataSource.title)
    }
    
    
    // Service
    typealias Service = UserService
    var service: UserService = UserService.shared
    var serviceInteractor: ViewModelServiceInteractor?

    
    private func getUserModel(title: String) {
        self.request(target: Service.Target.get(login: title), type: UserModel.self) { (user) in
            self.loadedData(model: user)
            self.getRepositories(title: title)
        }
    }
    
    private func getRepositories(title: String) {
        self.request(target: Service.Target.repository(login: title), type: [RepositoryModel].self) { (list) in
            self.loadedData(list: list)
        }
    }
    
    // Request sonucu response
    func loadedData(model: UserModel) {
        self.model  = model
        self.component = UserDetailComponentViewModel(model: model)
    }
    
    func loadedData(list: [RepositoryModel]) {
        self.repositories = list.compactMap { RepositoryCellModel(model: $0) }
        self.repository.cellModels = list
    }
}


