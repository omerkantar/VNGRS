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
        
        func instance<T: UIViewController>(type: T.Type) -> T {
            return storyboard.instance.instantiateViewController(withIdentifier: rawValue) as! T
        }
        
    }
    
    
    static func fromNavigationController(identifier: Identifier) -> UINavigationController {
        
        return UINavigationController(rootViewController: identifier.instance(type: UIViewController.self))
    }
   
    func push(viewController: UIViewController) {
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
