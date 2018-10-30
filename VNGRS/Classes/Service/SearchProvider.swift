//
//  SearchProvider.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import Moya


extension SearchService {
    public enum SearchTarget: TargetType {
        case keyword(query: String, page: Int, perPage: Int)

        public var baseURL: URL {
            return Service.baseURL
        }
        
        public var path: String {
            switch self {
            case .keyword:
                return "search/repositories"
            }
        }
        
        var parameters: [String: Any]? {
            switch self {
            case .keyword(let query, let page, let perPage):
                return ["q": query, "per_page": perPage, "page": page]
            }
        }
        
        public var method: Moya.Method {
            return Moya.Method.get
        }
        
        public var sampleData: Data {
            return Data()
        }
        
        var task: Task {
            if let parameters = parameters {
                if method == .post || method == .put {
                    return Task.requestParameters(parameters: parameters, encoding: JSONEncoding.default)
                }
                return Task.requestParameters(parameters: parameters, encoding: URLEncoding.default)
            }
            return Task.requestPlain
        }
        
        public var headers: [String : String]? {
            return nil
        }
        
        
        
    }
}


struct SearchService: ServiceInjector {
    
    typealias Target = SearchTarget

    static var shared = SearchService()
    
}
