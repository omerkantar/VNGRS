//
//  RepositoryDetailViewModel.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

class RepositoryDetailViewModel: RepositoryCellModel {

    var numberOfForks: Int = 0
    var numberOfStars: Int = 0
    var defaultBranch: String? = nil
    
    override init(model: RepositoryModel) {
        super.init(model: model)
        self.numberOfForks = model.numberOfForks
        self.defaultBranch = model.defaultBranch
    }
    
}
