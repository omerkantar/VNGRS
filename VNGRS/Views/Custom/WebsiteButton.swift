//
//  WebsiteButton.swift
//  VNGRS
//
//  Created by omer kantar on 4.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

class WebsiteButton: UIButton {

    var urlString: String?
    
    @discardableResult
    static func hiddenButton(url: String?) -> Bool {
        guard let string = url,
            let _ = URL(string: string) else {
            return true
        }
        return string.contains("http") == false
    }
    
    @discardableResult
    static func tapped(url: String?) -> Bool {
        guard !hiddenButton(url: url) else {
            return false
        }
        // Force kullanabiliriz ! 🦄
        Router.navigate(.website(url: URL(string: url!)!))
        return true
    }
    
    
    func build(url: String?) {
        urlString = url
        isHidden = WebsiteButton.hiddenButton(url: url)
        if isHidden { return }
        self.addTarget(self, action: #selector(tapped), for: .touchUpInside)
    }
    
    
    @objc func tapped() {
        WebsiteButton.tapped(url: urlString)
    }
}
