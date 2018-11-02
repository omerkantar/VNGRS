//
//  RepositoryCellModel.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

class RepositoryCellModel {

    let model: RepositoryModel
    
    var language: RepositoryModel.Language?
    
    var avatarViewModel: AvatarComponentViewModel?
    
    init(model: RepositoryModel) {
        self.model = model
        if let lang = model.language {
            self.language = RepositoryModel.Language(rawValue: lang)
        }
        if let owner = model.owner {
            self.avatarViewModel = AvatarComponentViewModel(owner: owner)
        }
    }
    
}
