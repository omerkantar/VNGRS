//
//  UITableViewCell+QueerCellConfiguration.swift
//  
//
//  Created by omer kantar on 18.05.2018.
//  Copyright © 2018 queers. All rights reserved.
//

import UIKit

// MARK: - QueerCellConfiguration
extension UIView: QueerCellConfiguration {
    @objc func configuration(model: Any?) { }
    
    @objc func didSelect(model: Any?) { }
}


// MARK: - Init

protocol QueerViewLoadable {
    associatedtype CustomViewType
    static func loadFromNib() -> CustomViewType
}

extension QueerViewLoadable where Self: UIView {
    static func loadFromNib() -> Self {
        guard let view = Bundle.main.loadNibNamed(String(describing: self), owner: nil, options: nil)?.first as? Self else {
            // your app should crash if the xib doesn't exist
            preconditionFailure("Couldn't load xib for view: \(self)")
        }
        return view
    }
}

