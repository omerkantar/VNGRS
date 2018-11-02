//
//  ImageView.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import Kingfisher

class ImageView: UIImageView {

    
    // MARK: - circle
    func circle() {
        self.layer.cornerRadius = self.bounds.width / 2.0
        self.layer.masksToBounds = true
    }

    // corner radius ekleniyor
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func cornerRadius(_ radius: CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = true
    }
}


extension UIImageView {
    func loadUrl(_ string: String?) -> Void {
        guard let url = string?.url else { self.image = nil; return }
        kf.setImage(with: url)
    }
}

extension String {
    var url: URL? {
        return URL(string: self)
    }
}
