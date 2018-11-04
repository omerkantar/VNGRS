//
//  Router+Navigation.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit



// MARK: - Navigation
extension Router {
    public enum Navigation {
        case userDetail(name: String)
        case repositoryDetail(model: RepositoryModel)
        case website(url: URL)
    }
}
