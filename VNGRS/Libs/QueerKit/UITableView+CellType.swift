//
//  UITableView+CellType.swift
//
//
//  Created by omer kantar on 4.10.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

extension UITableView {
    public enum CellType: QueerCellType {
        
        case repository
        case keyword
        
        
        
        var identifier: String {
            return nibName
        }
        
        var nibName: String {
            switch self {
            case .repository:
                return String(describing: RepositoryTableViewCell.self)
            case .keyword:
                return String(describing: KeywordTableViewCell.self)
            }
        }
    }
}
