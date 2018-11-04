//
//  Router.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import SafariServices

// MARK: - Router data
protocol RouterDataSource {

}


fileprivate typealias VCIdentifier = UIViewController.Identifier

// MARK: - Class
class Router {

    
    static func navigate(_ navigation: Navigation) -> Void {
        
        guard let nc = WindowManager.rootViewController() else { return }
        
        
        switch navigation {
        case .userDetail(let name):
            
            let router = UserDetailRouterData(title: name)
            
            let vc = VCIdentifier.userDetail.instance(type: UserDetailViewController.self)
            
            vc.configuration(dataSource: router)
            
            nc.pushViewController(vc, animated: true)

        case .repositoryDetail(let model):
            
            let router = RepositoryDetailRouterData(model: model)
            
            let vc = VCIdentifier.repositoryDetail.instance(type: RepositoryDetailViewController.self)
            vc.configuration(dataSource: router)
            nc.pushViewController(vc, animated: true)

        case .website(let url):
            
            let safariViewController = SFSafariViewController(url: url)
            nc.present(safariViewController, animated: true, completion: nil)
        }
        
    }
}






