//
//  LicenseModel.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

struct LicenseModel: Codable {

    
    var key: String?
    var name: String?
    var url: String?
    
    enum CodingKeys: String, CodingKey {
        case key
        case name
        case url
    }
    
}
