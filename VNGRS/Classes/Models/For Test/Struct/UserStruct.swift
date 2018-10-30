//
//  UserStruct.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
/*
     id": 1,
     "name": "Refik",
     "surname": "Anadol",
     "photo": "",
     "createdDate": null,
     "social": {
         "twitter": "",
         "facebook": "",
         "instagram": ""
 }
 
 */

struct UserEntity: Codable {
    
    var id: Int = -1
    var name: String?
    var surname: String?
    var photoUrl: String?
    var createdDate: String?

    //Custom Keys
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case surname
        case photoUrl = "photo"
        case createdDate

    }

}

