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
    
    var hiddenMoreButton: Bool = true
    
    var cellType: UICollectionView.CellType = .repository
    
    var cellSize: CGSize
    
    var collectionDataSource: QueerCollectionViewDataSource? = nil
    
    var observer: ViewModelObserver? = nil
   
    var cellModels: [Any]? = nil {
        didSet {
            observer?.observe(cellModels, forKey: ViewModelObserverKey.models.rawValue, sender: nil)
        }
    }
    
    var webUrl: String? {
        didSet {
            self.hiddenMoreButton = WebsiteButton.hiddenButton(url: webUrl)
        }
    }
    
    init() {
        let screenSize = UIScreen.main.bounds.size
        let space: CGFloat = 30.0
        let width: CGFloat = screenSize.width - space
        cellSize = CGSize(width: width, height: 260.0)
    }
    
    func moreButtonTapped() {
        WebsiteButton.tapped(url: webUrl)
    }
}



