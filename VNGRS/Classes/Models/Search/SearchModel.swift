//
//  SearchModel.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

struct SearchModel: Codable {

    var totalCount: Int = 0
    var incompleteResults: Bool
    var items: [RepositoryModel]?
    
    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }

}

// TODO: - bu respositoryModel.swift dosyasina konulacak
struct RepositoryModel: Codable {
    
    var id: Int = 0
    var nodeId: String?
    var name: String
    var fullName: String?
    var createdAt: String?
    var language: String?
    var description: String?
    
    //Custom Keys
    enum CodingKeys: String, CodingKey {
        case id
        case nodeId = "node_id"
        case name
        case fullName = "full_name"
        case createdAt = "created_at"
        case language
        case description
    }
    
}
