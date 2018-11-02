//
//  UserDetailRouter.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

protocol UserDetailDataSource {
    var title: String { set get }
}

struct UserDetailRouterData: RouterDataSource, UserDetailDataSource {

    var title: String

    init(title: String) {
        self.title = title
    }
    
}
