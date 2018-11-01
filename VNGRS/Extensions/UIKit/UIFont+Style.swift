//
//  UIFont+Style.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

// Tum fontlarin tipi olacak buradan label, text font atamasi yapilacak.
//
extension UIFont {
    public enum Style {
        case barTitle
        
        
        var font: UIFont {
            switch self {
            case .barTitle:
                return UIFont.systemFont(ofSize: 28.0, weight: .bold)
           
            }
        }
    }
}
