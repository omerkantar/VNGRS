//
//  UserManager.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

class ParseManager {
    
    static func parse<T: Codable>(_ type: [T].Type, jsonList: [[String: Any]]) -> [T] {
        
        do {
            
            let jsonAsData = try JSONSerialization.data(withJSONObject: jsonList, options: .prettyPrinted)
            let decode = JSONDecoder()
            let objects = try decode.decode(type, from: jsonAsData)
            
            return objects
            
        } catch let error {
            debugPrint("error \(#function) catch \(error)")
        }
        
        return [T]()
    }
    
    
    
    static func parse<T: Codable>(_ type: T.Type, json: [String: Any]) -> T? {
        
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let decode = JSONDecoder()
            let object = try decode.decode(type, from: jsonAsData)
           
            return object
        } catch let error {
            debugPrint("error \(#function) catch \(error)")
        }
        
        return nil
    }
}
