//
//  ViewModel+Service.swift
//  VNGRS
//
//  Created by omer kantar on 1.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import Moya


typealias ServiceResult = Service.Result
// TODO: View model'e bu service class inject edilecek injector protocol ile
protocol ViewModelServiceInjector {
    // generic Service type
    associatedtype Service: ServiceInjector
    // service objesi
    var service: Service { get }
    // service interactor protocol ile view controller'a gidip pop up vb seyler cikartilacak
    var serviceInteractor: ViewModelServiceInteractor? { set get }
    
    // completion
    func serviceCompleted(target: Service.Target, result: ServiceResult) -> Void
}

// Request atilmasi da buradan saglancak
extension ViewModelServiceInjector {
    
    // Code tekrarini onlemek icin request completion yapisi 1 yerde handle edilsin diger yerlere de buradan dagilsin
    // success gonderilecek
    func request<T: Codable>(target: Service.Target, type: T.Type, success: @escaping (_ response: T) -> Void) {
        
        service.request(target: target, type: type) { (result) in
            switch result {
            case .success(let response):
                guard let object = response as? T else { return }
                success(object)
            case .failure(let error, let isMappingError):
                self.serviceInteractor?.serviceNetworError(error: error, isMappingError: isMappingError)
            }
            self.serviceCompleted(target: target, result: result)
        }
        
    }
    
    // completed
    func serviceCompleted(target: Service.Target, result: ServiceResult) -> Void {
        
    }
}

// UIViewController hata cikartabilir buradan 
protocol ViewModelServiceInteractor {
    func serviceNetworError(error: Error?, isMappingError: Bool)
}
