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
    var bio: String?
    var location: String?
    var createdAt: String?
    var company: String?
    
    var followersUrl: String?
    var followingUrl: String?
    var gitstUrl: String?
    var reposUrl: String?
    var websiteUrl: String?
    
    //Custom Keys
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case name
        case avatarUrl = "avatar_url"
        
        case numberOfPublicRepos = "public_repos"
        case numberOfGists = "public_gists"
        case numberOfFollowers = "followers"
        case numberOfFollowings = "following"
        
        case blog
        case bio
        case location
        case createdAt = "created_at"
        case company
        
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gitstUrl = "gists_url"
        case reposUrl = "repos_url"
        case websiteUrl = "html_url"
        
    }
    
}
