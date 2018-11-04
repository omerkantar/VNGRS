//
//  CollectionTableViewCell.swift
//  VNGRS
//
//  Created by omer kantar on 4.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

// MARK: - Cell View model'lar bundan implemente alsin
protocol CollectionTableViewDataSource {
    var title: String { set get }
    var hiddenMoreButton: Bool { set get }
    
    // collection
    var cellType: UICollectionView.CellType { set get }
    var cellModels: [Any]? { set get }
    var cellSize: CGSize { set get }
    
    // ya da
    var collectionDataSource: QueerCollectionViewDataSource? { set get }
    
    // liste guncellenebilir
    var observer: ViewModelObserver? { set get }
    
    // more button action
    func moreButtonTapped() -> Void
}

// opsional functionlar
extension CollectionTableViewDataSource {
    func moreButtonTapped() -> Void { }
}

// generic class
class CollectionTableViewCell: UITableViewCell, ViewModelObserver {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var moreButton: UIButton!
    @IBOutlet weak var collectionView: QueerCollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    
    // data source
    var dataSource: CollectionTableViewDataSource?
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        collectionView.contentInset = UIEdgeInsets(top: 0.0, left: 14.0, bottom: 0.0, right: 14.0)
    }

    override func configuration(model: Any?) {
        guard let dataSource = model as? CollectionTableViewDataSource else { return }
        self.dataSource = dataSource
        titleLabel.text = dataSource.title
        self.dataSource?.observer = self
        moreButton.isHidden = dataSource.hiddenMoreButton
        if let collection = dataSource.collectionDataSource {
            collectionView.setDataSource(collection)
        } else {
            collectionView.set(cellType: dataSource.cellType, models: dataSource.cellModels, size: dataSource.cellSize)

        }
        
        // Note: - Horizontal oldugundan
        self.collectionViewHeightConstraint.constant = dataSource.cellSize.height
        
    }
    
    
    // MARK: - Observer
    func observe(_ object: Any?, forKey: String, sender: Any?) {
        
        guard let key = ViewModelObserverKey.init(rawValue: forKey) else { return }
        
        switch key {
        case .models:
            moreButton.isHidden = self.dataSource!.hiddenMoreButton
            collectionView.models = object as? [Any]
            collectionView.reloadData()
        }
    }
    
    
    // MARK: - Action
    @IBAction func moreButtonTapped() {
        dataSource?.moreButtonTapped()
    }
    
}

