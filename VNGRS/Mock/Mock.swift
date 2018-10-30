//
//  Mock.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit


enum Mock: String {
    case users = "users"
    
    
    var json: [String: Any] {
        
        if let path = Bundle.main.path(forResource: rawValue, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if let json = result as? [String: Any] {
                    return json
                }
                
            } catch let error {
                // handle error
                print("json file error \(self) \(error)")
            }
        }
        return [String: Any]()
    }
    
}
