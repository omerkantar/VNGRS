//
//  UIColor+Theme.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

// TODO: Theme gore degisecek olan renkler
extension UIColor {
    
    var titleColor: UIColor {
        switch ThemeManager.current() {
        case .dark:
            return .white
        case .light:
            return .black
        }
    }
    
    var subtitleColor: UIColor {
        return .gray
    }
    
    
    var backgroundColor: UIColor {
        switch ThemeManager.current() {
        case .dark:
            return .black
        case .light:
            return .white
        }
    }
}
