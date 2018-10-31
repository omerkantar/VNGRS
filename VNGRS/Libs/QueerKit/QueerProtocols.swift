//
//  QueerProtocols.swift
//
//
//  Created by omer kantar on 17.05.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

// MARK: - QueerCellTypeBuilder
protocol QueerCellType {
    // cell identifier
    var identifier: String { get }
    // nib is "", empty register with class
    var nibName: String { get }
}

// MARK: - Cell Configuaration
protocol QueerCellConfiguration {
    func configuration(model: Any?) -> Void
}

// MARK: - QueerDataSource
protocol QueerViewDataSource: class {
    func queerViewNumberOfSections() -> Int
    func queerViewNumberOfRows(section: Int) -> Int
    func queerViewCellClouserAtIndexPath(_ indexPath: IndexPath) -> (cellModel: Any?, cellType: QueerCellType)?
}

extension QueerViewDataSource {
    func queerViewNumberOfSections() -> Int { return 1 }
    func queerViewNumberOfRows(section: Int) -> Int { return 0 }
}


