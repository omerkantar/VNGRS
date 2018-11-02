//
//  AvatarComponentViewModel.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit


class AvatarComponentViewModel: AvatarComponentDataSource {
    var title: String
    var imageUrl: String?
    init(title: String, imageUrl: String?) {
        self.title = title
        self.imageUrl = imageUrl
    }
    
    init(owner: OwnerModel) {
        self.title = owner.login ?? "vngrs"
        self.imageUrl = owner.avatarUrl
    }
    
    init(user: UserModel) {
        self.title = user.login ?? "vngrs"
        self.imageUrl = user.avatarUrl
    }
}
