//
//  UICollectionView+QueerViewBuilder.swift
//
//
//  Created by omer kantar on 18.05.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

// MARK: - UICollectionView
extension UICollectionView {
    func register(type: CellType) {
        self.register(UINib(nibName: type.nibName, bundle: nil), forCellWithReuseIdentifier: type.identifier)
    }
    
    func register(types: [CellType]) {
        types.forEach { self.register(type: $0) }
    }
    
    func dequeue(type: CellType, indexPath: IndexPath, model: Any?) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: type.identifier, for: indexPath)
        cell.configuration(model: model)
        return cell
    }
}
