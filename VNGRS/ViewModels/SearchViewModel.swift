//
//  SearchViewModel.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit


class SearchViewModel {
    
    var keyword: String?
    var repositories: [RepositoryModel]?
    
    func search(keyword: String?) {
        guard let keyword = keyword, keyword.count > 3 else {
            
            repositories?.removeAll()
            return
        }
        
        
    }
}
