//
//  ViewModel.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import Moya

protocol ViewModelDataSourceInjector {
    associatedtype DataSource
    func bind(dataSource: DataSource)
}

enum ViewModelObserverKey: String {
    case models = "models"
}

protocol ViewModelObserver {
    func observe(_ object: Any?, forKey: String, sender: Any?) -> Void
}

protocol ViewModelObserveInjector {
    associatedtype Observer
    var observer: Observer? { set get }
}

