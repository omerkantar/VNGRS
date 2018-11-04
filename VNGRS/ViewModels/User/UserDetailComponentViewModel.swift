//
//  UserDetailComponentViewModel.swift
//  VNGRS
//
//  Created by omer kantar on 4.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

class UserDetailComponentViewModel {

    var model: UserModel
    var avatar: AvatarComponentViewModel
    var createdAtDate: String?
    var following: AttributeStackViewModel?
    var followers: AttributeStackViewModel?
    var gists: AttributeStackViewModel?
    var repositories: AttributeStackViewModel?
    
    init(model: UserModel) {
        self.model = model
        self.avatar = AvatarComponentViewModel(user: model)
        self.createdAtDate = model.createdAt?.dateString
        
        
        self.followers = AttributeStackViewModel(title: model.numberOfFollowers.numberOfForks)
        self.following = AttributeStackViewModel(title: model.numberOfFollowings.numberOfFollowings)
        self.gists = AttributeStackViewModel(title: model.numberOfGists.numberOfGists)
        self.repositories = AttributeStackViewModel(title: model.numberOfPublicRepos.numberOfRepositories)
    }
    

}
