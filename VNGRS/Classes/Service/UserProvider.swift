//
//  UserProvider.swift
//  VNGRS
//
//  Created by omer kantar on 4.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import Moya


extension UserService {
    public enum UserTarget: TargetType, TargetParametersDataSource {
        
        
        case get(login: String)
        case repository(login: String)
        
        public var path: String {
            switch self {
            case .get(let login):
                return "users/\(login)"
            case .repository(let login):
                return "users/\(login)/repos"
            }
        }
        
        var parameters: [String: Any]? {
            return nil
        }
        
        public var method: Moya.Method {
            return Moya.Method.get
        }
        
    }
}


struct UserService: ServiceInjector {
    
    typealias Target = UserTarget
    
    static var shared = UserService()
    
}
