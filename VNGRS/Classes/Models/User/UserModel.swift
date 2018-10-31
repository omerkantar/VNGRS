//
//  UserModel.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

struct UserModel: Codable {
    
    var id: Int
    var login: String?
    var name: String?
    var avatarUrl: String?
    var numberOfPublicRepos: Int = 0
    var numberOfGists: Int = 0
    var numberOfFollowers: Int = 0
    var numberOfFollowings: Int = 0
    var blog: String?
    var location: String?
    var createdAt: String?
    
    
    //Custom Keys
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case name
        case avatarUrl = "avatar_url"
        case numberOfPublicRepos = ""
        case numberOfGists = "gists"
        case numberOfFollowers = "followers"
        case numberOfFollowings = "followings"
        case blog
        case location
        case createdAt = "created_at"
    }
    
}
