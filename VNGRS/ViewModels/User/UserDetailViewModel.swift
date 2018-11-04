//
//  UserDetailViewModel.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit


// MARK: - CollectionTableViewDataSource

class UserDetailViewModel: ViewModelDataSourceInjector {
    
    var title: String?
    var model: UserModel?
    var avatar: AvatarComponentViewModel?
    var repository = RepositoryCollectionTableCellModel()
    
    
    // Data source gelip bind edecek
    typealias DataSource = UserDetailDataSource
    func bind(dataSource: UserDetailDataSource) {
        // load data
        self.title = dataSource.title
    }
    
    
    // Request sonucu response
    func loadedData(model: UserModel) {
        self.model  = model
        self.avatar = AvatarComponentViewModel(user: model)
    }
}


