//
//  ServiceInjector.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import Alamofire
import Moya

enum Service {
    public enum Result {
        case success(response: Any)
        case failure(error: Error, isMappingError: Bool)
    }
    
    static var baseURL: URL = URL(string: "https://api.github.com/")!
}

protocol ServiceInjector {
    associatedtype Target: TargetType
}

typealias ServiceCompletion = (_ result: Service.Result) -> Void

extension ServiceInjector {
    func request<T: Codable>(target: Target,
                             type: T.Type,
                             completion: ServiceCompletion? = nil) {
        
        let provider = MoyaProvider<Target>()

        provider.request(target) { (result) in
            switch result {
            case let .success(response):
                
                do {
                    let success = try response.map(type)
                    debugPrint("Success...\(success)")
                    completion?(.success(response: success))
                } catch let error {
                    debugPrint(error)
                    completion?(.failure(error: error, isMappingError: true))
                }
            case let .failure(error):
                debugPrint("Error...\(error)")
                completion?(.failure(error: error, isMappingError: false))
            }
        }
    }
    
    
    func cancelRequest() {
        let sessionManager = Alamofire.SessionManager.default
        sessionManager
            .session
            .getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
                dataTasks.forEach {
                    $0.cancel()
                }
                uploadTasks.forEach {
                    $0.cancel()
                }
                downloadTasks.forEach {
                    $0.cancel()
                }
        }
    }
}



protocol TargetParametersDataSource {
    var parameters: [String: Any]? { get }
}


// MARK: - Target typelar target parameters data source olabilir
extension TargetParametersDataSource {
    func getTask(method: Moya.Method) -> Task {
        if let parameters = parameters {
            if method == .post || method == .put {
                return Task.requestParameters(parameters: parameters, encoding: JSONEncoding.default)
            }
            return Task.requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
        return Task.requestPlain
    }
}


// MARK: - Target ortak olanlar extension ile yazilmistir
extension TargetType {
    public var sampleData: Data {
        return Data()
    }
    
    public var baseURL: URL {
        return Service.baseURL
    }

    public var headers: [String : String]? {
        return nil
    }
    
    public var task: Task {
        return (self as? TargetParametersDataSource)?.getTask(method: method) ?? .requestPlain
    }
}
