//
//  RepositoryCollectionTableCellModel.swift
//  VNGRS
//
//  Created by omer kantar on 4.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

class RepositoryCollectionTableCellModel: CollectionTableViewDataSource {
    
    
    var title: String = "Repositories"
    
    var hiddenMoreButton: Bool = false
    
    var cellType: UICollectionView.CellType = .repository
    
    var cellSize: CGSize
    
    var collectionDataSource: QueerCollectionViewDataSource? = nil
    
    var observer: ViewModelObserver? = nil
   
    var cellModels: [Any]? = nil {
        didSet {
            observer?.observe(cellModels, forKey: ViewModelObserverKey.models.rawValue, sender: nil)
        }
    }
    
    init() {
        let screenSize = UIScreen.main.bounds.size
        let space: CGFloat = 20.0
        let width: CGFloat = screenSize.width - space
        cellSize = CGSize(width: width, height: 280.0)
    }
    
}



