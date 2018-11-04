//
//  SearchViewModel.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import RxSwift


class SearchViewModel: ViewModelServiceInjector {
    
    
    // MARK: - Service
    typealias Service = SearchService
    var service: SearchService {
        return SearchService.shared
    }
    // view controller eklenecek
    // TODO: - View controller+ alert eklenebilir
    var serviceInteractor: ViewModelServiceInteractor?
    
    // bu table view bind edilecek
    var repositories = Variable<[RepositoryCellModel]>([])
    
    // For cancel request sondaki request cancel edilecek
    private var isLoading: Bool = false
    
    // Search
    func search(keyword: String?) {
        
        guard let keyword = keyword else {
            repositories.value.removeAll()
            return
        }
        
        if keyword.count < 3 {
            return
        }
        
        // repository insa edilecek
        let target = Service.Target.keyword(query: keyword, page: 1, perPage: 20)
        
        request(target: target, type: SearchModel.self) { [weak self] (model) in
            // Note -> eski data silinecek
            self?.repositories.value.removeAll()
            self?.repositories.value = model.items?.compactMap { RepositoryCellModel(model: $0) } ?? []
        }
        
    }
    
    
    
}
