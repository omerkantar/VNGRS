//
//  RepositoryModel.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit



struct RepositoryModel: Codable {
    
    var id: Int = 0
    var nodeId: String?
    var name: String
    var fullName: String?
    var createdAt: String?
    var language: String?
    var description: String?
    var owner: OwnerModel?
    var defaultBranch: String?
    var numberOfForks: Int = 0
    var numberOfStars: Int = 0
    var numberOfWatchers: Int = 0
    var size: Int = 0
    var license: LicenseModel?
    var homepageUrl: String?
    var gitUrl: String?
    
    //Custom Keys
    enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case name
        case fullName = "full_name"
        case createdAt = "created_at"
        case language
        case description
        case owner
        case defaultBranch = "default_branch"
        case numberOfForks = "forks_count"
        case numberOfStars = "stargazers_count"
        case numberOfWatchers = "watchers_count"
        case size
        case license
        case homepageUrl = "homepage"
        case gitUrl = "git_url"
        
    }
    
    
}
