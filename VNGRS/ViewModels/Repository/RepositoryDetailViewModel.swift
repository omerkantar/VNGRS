//
//  RepositoryDetailViewModel.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

class RepositoryDetailViewModel: RepositoryCellModel {

    var numberOfForks: String?
    var numberOfStars: String?
    var numberOfWatchers: String?
    var defaultBranch: String?
    
    override init(model: RepositoryModel) {
        super.init(model: model)
        self.numberOfForks = model.numberOfForks.numberOfForks
        self.numberOfStars = model.numberOfStars.numberOfStars
        self.numberOfWatchers = model.numberOfWatchers.numberOf(item: "Whatchers:")
        self.defaultBranch = model.defaultBranch
        
    }
    
}
