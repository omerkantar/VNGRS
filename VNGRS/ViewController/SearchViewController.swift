//
//  SearchViewController.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {

    

    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        SearchService.shared.request(target: SearchService.SearchTarget.keyword(query: "moya", page: 1, perPage: 10), type: SearchModel.self) { (result) in
            
            switch result {
                
            case .success(let response):
                
                break
                
            case .failure(let error, let isMappingError):
                break
            }
        }
    }
    

    override func isShowingNavigationBar() -> Bool {
        return false
    }

}
