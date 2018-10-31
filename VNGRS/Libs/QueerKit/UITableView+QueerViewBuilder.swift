//
//  UITableView+CellDelegate.swift
//  
//
//  Created by omer kantar on 18.05.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit


// MARK: - QueerViewBuilder
extension UITableView {
    func register(type: CellType) {
        self.register(UINib(nibName: type.nibName, bundle: nil), forCellReuseIdentifier: type.identifier)
    }
    
    func register(types: [CellType]) {
        types.forEach { self.register(type: $0) }
    }
    
    func dequeue(type: CellType, indexPath: IndexPath, model: Any?) -> UITableViewCell {
        
        let cell = self.dequeueReusableCell(withIdentifier: type.identifier, for: indexPath)
        cell.configuration(model: model)
        return cell
    }
    
}

// MARK: - Build
extension UITableView {
    @objc func build() {
        self.keyboardDismissMode = .onDrag
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.tableFooterView = UIView(frame: .zero)
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = UITableView.automaticDimension
        self.isUserInteractionEnabled = true
        self.allowsMultipleSelection = false
    }
}
