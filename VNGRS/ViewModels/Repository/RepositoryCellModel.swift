//
//  RepositoryCellModel.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

// Builder Stucture
class AttributeStackViewModel {
    var title: String?
    var color: UIColor?
    var webUrl: String?
    var icon: UIImage?
    
    init(title: String? = nil,
         color: UIColor? = nil,
         webUrl: String? = nil,
         icon: UIImage? = nil) {
        self.title = title
        self.color = color
        self.webUrl = webUrl
        self.icon = icon
    }
}

class RepositoryCellModel {

    let model: RepositoryModel
    var language: AttributeStackViewModel?
    var avatarViewModel: AvatarComponentViewModel?
    var forks: AttributeStackViewModel?
    var stars: AttributeStackViewModel?

    var createdDate: String?

    init(model: RepositoryModel) {
        self.model = model
        self.createdDate = model.createdAt?.dateString
        
        if let lang = model.language {
            let localLanguage = RepositoryModel.language(lang)
            self.language = AttributeStackViewModel(title: lang, color: localLanguage?.color ?? .red)
        }
        
        if let owner = model.owner {
            self.avatarViewModel = AvatarComponentViewModel(owner: owner)
        }
        
        if model.numberOfForks > 0 {
            self.forks = AttributeStackViewModel(title: model.numberOfForks.numberOfForks)
        }
        
        if model.numberOfStars > 0 {
            self.stars = AttributeStackViewModel(title: model.numberOfForks.numberOfStars)
        }
    }
    
    func navigateRepositoryDetail() {
        Router.navigate(.repositoryDetail(model: model))
    }
}
