//
//  QueerTableView.swift
//  
//
//  Created by omer kantar on 8.10.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

protocol QueerTableViewConfigure: NSObjectProtocol {
    func queerTableView(_ tableView: QueerTableView, didConfigure cell: UITableViewCell, indexPath: IndexPath) -> Void
}

protocol QueerScrollViewDelegate: NSObjectProtocol {
    func queerTableView(_ tableView: QueerTableView, didScroll scrollView: UIScrollView) -> Void
}

class QueerTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    private var rowModelOfCellType = [[CellType: [Any]?]]()
    
    weak var configure: QueerTableViewConfigure?
    
    weak var scrollDelegate: QueerScrollViewDelegate?
    
    // MARK: -
    override func awakeFromNib() {
        super.awakeFromNib()
        build()
        dataSource = self
        delegate = self
    }
    
    
    // MARK: - models
    func add(models: [Any]?, cellType: CellType) {
        register(type: cellType)
        rowModelOfCellType.append([cellType: models])
    }
    
    
    // MARK: - DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return rowModelOfCellType.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rowModelOfCellType[section].first?.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let object = rowModelOfCellType[indexPath.section].first else {
            return UITableViewCell()
        }
        let cellType = object.key
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier, for: indexPath)
        if let list = object.value, list.count-1 >= indexPath.row {
            let model = list[indexPath.row]
            cell.configuration(model: model)
        }
        configure?.queerTableView(self, didConfigure: cell, indexPath: indexPath)
        return cell
    }
    
    // MARK: - Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let object = rowModelOfCellType[indexPath.section].first else { return }
        let model = object.value?[indexPath.row]
        tableView.cellForRow(at: indexPath)?.didSelect(model: model)
    }
    
    
    // MARK: - Scroll Delegate
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        scrollDelegate?.queerTableView(self, didScroll: scrollView)
    }
}

