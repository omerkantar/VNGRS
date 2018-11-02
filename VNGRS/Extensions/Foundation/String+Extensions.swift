//
//  String+Extensions.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import Foundation


extension String {
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        guard let date = formatter.date(from: self) else { return "" }
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}
