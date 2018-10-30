//
//  Router.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

// MARK: - Router data
extension Router {
    public enum Navigation {
        case userDetail(id: Int)
        case repositoryDetail(id: String)
    }
}

protocol RouterDataSource { }

class Router {

    static func navigate(_ navigation: Navigation) -> Void {
        
    }
}
