//
//  RepositoryCellModel.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

// Builder Stucture
struct AttributeStackViewBuilder {
    var title: String
    var color: UIColor? = nil
}

class RepositoryCellModel {

    let model: RepositoryModel
    var language: AttributeStackViewBuilder?
    var avatarViewModel: AvatarComponentViewModel?
    var createdDate: String?
    var fork: AttributeStackViewBuilder?
    var star: AttributeStackViewBuilder?
    
    init(model: RepositoryModel) {
        self.model = model
        self.createdDate = model.createdAt?.dateString
        
        if let lang = model.language {
            let localLanguage = RepositoryModel.language(lang)
            self.language = AttributeStackViewBuilder(title: lang, color: localLanguage?.color ?? .red)
        }
        if let owner = model.owner {
            self.avatarViewModel = AvatarComponentViewModel(owner: owner)
        }
        
        if model.numberOfForks > 0 {
            numberOfForks = AttributeStackViewBuilder(title: "🍴 Forks:\(model.numberOfForks)")
        }
        
        if model.numberOfStars > 0 {
            star = AttributeStackViewBuilder(title: "⭐️ Stars:\(model.numberOfStars)")
        }
    }
    
    func navigateRepositoryDetail() {
        Router.navigate(.repositoryDetail(model: model))
    }
}
