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

