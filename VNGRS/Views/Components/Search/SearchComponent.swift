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
    @IBOutlet weak var cancelButton: UIButton!
    


    // Initialize
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.font = UIFont.Style.barTitle.font
        textField.textColor = .black
        textField.delegate = self
        textField.attributedPlaceholder = NSAttributedString(string: "Search repository",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])

    }

    
    

    // Interface builder action funcs
    @IBAction func clearButtonTapped() {
        textField.resignFirstResponder()
    }
    
}

// MARK: - UITextFieldDelegate
extension SearchComponent: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        cancelButton.isHidden = false
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        cancelButton.isHidden = false
    }
}
