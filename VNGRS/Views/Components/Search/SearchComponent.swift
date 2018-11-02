//
//  SearchComponent.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import RxSwift

class SearchComponent: UIView, QueerViewLoadable {

    @IBOutlet weak var textField: UITextField!
    
    // Initialize
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.font = UIFont.Style.barTitle.font
        textField.textColor = .black
        textField.placeholder = "Search 🚀"
        textField.returnKeyType = .search
//        textField.attributedPlaceholder = NSAttributedString(string: "Search repository",
//                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])

    }

    
}


