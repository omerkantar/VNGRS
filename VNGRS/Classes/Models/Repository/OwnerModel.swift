//
//  OwnerModel.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

enum OwnerType: String {
    case undefined // 🦄
    case user = "User"
    case organization = "Organization"
}

struct OwnerModel: Codable {

    var id: Int
    var login: String?
    var nodeId: String?
    var avatarUrl: String?
    var reposUrl: String?
    var type: String?
    
    
    
    //Custom Keys
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case nodeId = "node_id"
        case avatarUrl = "avatar_url"
        case reposUrl
        case type
    }
    
    
    func getType() -> OwnerType {
        guard let type = type,
            let find = OwnerType(rawValue: type) else { return .undefined }
        return find
    }
}
