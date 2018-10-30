//
//  UIViewController+Storyboard.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

extension UIViewController {
    
    // MARK: - Storyboard
    public enum Storyboard: String {
        case search = "Search"
        case user = "User"
        case repository = "Repository"

        var instance: UIStoryboard {
            // Main Bundle -> bulunan project/module
            return UIStoryboard(name: rawValue, bundle: Bundle.main)
        }
    }
    
    
    public enum Identifier: String {
        case search = "search"
        case userDetail = "userDetail"
        case repositoryDetail = "repositoryDetail"

        var storyboard: Storyboard {
            switch self {
            case .search:
                return .search
            case .repositoryDetail:
                return .repository
            case .userDetail:
                return .user
            }
        }
    }
    
    
    static func initialize(from identifier: Identifier) -> UIViewController {
        return identifier.storyboard.instance.instantiateViewController(withIdentifier: identifier.rawValue)
    }

    
    static func fromNavigationController(identifier: Identifier) -> UINavigationController {
        return UINavigationController(rootViewController: initialize(from: identifier))
    }
}
