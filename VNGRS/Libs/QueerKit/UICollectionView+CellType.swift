//
//  UICollectionView+CellType.swift
//  
//
//  Created by omer kantar on 4.10.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit


extension UICollectionView {
    public enum CellType: QueerCellType {
        case repository
        
        
        var identifier: String {
            return nibName
        }
        
        var nibName: String {
            switch self {
            case .repository:
                return String(describing: RepositoryCollectionViewCell.self)
            }
        }
    }
}
