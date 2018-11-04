//
//  QueerCollectionView.swift
//  
//
//  Created by omer kantar on 16.10.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

protocol QueerCollectionViewCellConfiguration: NSObjectProtocol {
    func queerCollectionView(_ collectionView: QueerCollectionView, didConfigure cell: UICollectionViewCell, atIndexPath: IndexPath) -> Void
}

protocol QueerCollectionViewDataSource {
    var cellType: UICollectionView.CellType { set get }
    var cellModels: [Any]? { set get }
    var cellSize: CGSize { set get }
    var contentInset: UIEdgeInsets { set get }
    var minimumLineSpacing: CGFloat { set get }
    var minimumInteritemSpacing: CGFloat { set get }
    var cellContentInset: UIEdgeInsets { set get }
}

// MARK: - Class
class QueerCollectionView: UICollectionView {
    
    var cellType: CellType?
    
    var models: [Any]?
    
    var cellSize: CGSize = .zero
    
    weak var cellConfiguration: QueerCollectionViewCellConfiguration?
    
    fileprivate var queerDataSource: QueerCollectionViewDataSource?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.dataSource = self
        self.delegate = self
    }
    
    func set(cellType: CellType, models: [Any]?, size: CGSize) {
        self.cellSize = size
        self.cellType = cellType
        self.models = models
        self.register(type: cellType)
        self.realodCollectionView()
    }
    
    func setDataSource(_ dataSource: QueerCollectionViewDataSource) {
        self.set(cellType: dataSource.cellType, models: dataSource.cellModels, size: dataSource.cellSize)
        self.contentInset = dataSource.contentInset
        
    }
    
    private func realodCollectionView() {
        reloadData()
    }
    
    fileprivate func safeCellModel(row: Int) -> Any? {
        var model: Any? = nil
        if let models = models, models.count > row {
            model = models[row]
        }
        return model
    }
}

// MARK: - CollectionViewDataSource
extension QueerCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let model = safeCellModel(row: indexPath.row)
        
        guard let cellType = cellType else {
            return UICollectionViewCell()
        }
        let cell = collectionView.dequeue(type: cellType, indexPath: indexPath, model: model)
        cellConfiguration?.queerCollectionView(self, didConfigure: cell, atIndexPath: indexPath)
        return cell
    }
    
}
// MARK: - UICollectionViewDelegateFlowLayout
extension QueerCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return self.queerDataSource?.minimumLineSpacing ?? 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return self.queerDataSource?.minimumInteritemSpacing ?? 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return self.queerDataSource?.contentInset ?? .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
}

// MARK: - CollectionViewDelegate
extension QueerCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let model = safeCellModel(row: indexPath.row)
        collectionView.cellForItem(at: indexPath)?.didSelect(model: model)
    }
}



// MARK: - Extension
extension QueerCollectionViewDataSource {
    func getCellSize(collectionViewSize: CGSize, line: Int, interitem: Int, isSquare: Bool) -> CGSize {
        
        let interitem: CGFloat = CGFloat(interitem)
        let line: CGFloat = CGFloat(line)
        // size
        let height: CGFloat = collectionViewSize.height
        let width: CGFloat = collectionViewSize.width
        // collection content inset silinecek
        var safeWidth = width - contentInset.left - contentInset.right
        var safeHeight = height - contentInset.top - contentInset.bottom
        // spacingler silinecek
        safeWidth -= (minimumInteritemSpacing * (interitem - 1.0))
        safeHeight -= (minimumLineSpacing * (line - 1.0))
        
        var cellSize = CGSize(width: safeWidth / interitem, height: safeHeight / line)
        if (isSquare) {
            let lenght = CGFloat(min(cellSize.width, cellSize.height))
            cellSize.width = lenght
            cellSize.height = lenght
        }
        return cellSize
    }
    
    
    func getCollectionViewSize(cellSize: CGSize, line: Int, interitem: Int) -> CGSize {
        let line: CGFloat  = CGFloat(line)
        let interitem = CGFloat(interitem)
        var size = CGSize.zero
        // safe area
        var safeHeight = cellSize.height * line
        var safeWidth = cellSize.width * interitem
        // spacing
        safeHeight += (minimumLineSpacing * (line - 1.0))
        safeWidth += (minimumInteritemSpacing * (interitem - 1.0))
        // content inset
        size.width += contentInset.left + contentInset.right + safeWidth
        size.height += contentInset.bottom + contentInset.top + safeHeight
        return size
    }
}

