//
//  UserManager.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

class UserManager {

    static var shared = UserManager()
    var json: [String: Any]
    var classes: [UserModel]?
    var structs: [UserEntity]?
    
    init() {
        self.json = Mock.users.json
        self.parse()
    }
    
    
    private func parse() {
        
        guard let json = Mock.users.json["users"] as? [[String: Any]] else { return }
        
        let models = parse(UserModel.self, jsonList: json)
        let structs = parse(UserEntity.self, jsonList: json)
        
    }
    
    
    func parse<T: Codable>(_ type: T.Type, jsonList: [[String: Any]]) -> [T] {
        
        do {
            
            let decode = JSONDecoder()
            let jsonAsData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let objects = try decode.decode([type], from: jsonAsData)
            return (objects as? [T]) ?? [T]()
        } catch let error {
            debugPrint("error \(#function) catch \(error)")
        }
        
        return [T]()
    }
    
}
