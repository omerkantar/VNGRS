//
//  RepositoryDetailBottomBar.swift
//  VNGRS
//
//  Created by omer kantar on 4.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

class RepositoryDetailBottomBar: UIView {

    @IBOutlet weak var avatar: AvatarComponent!
    @IBOutlet weak var websiteButton: WebsiteButton!

    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.imageView.circle()
        avatar.addUserDetailInteraction()
    
    }
    
    // MARK: - Configuration
    func configuration(avatar: AvatarComponentViewModel?, websiteUrl: String?) {
        if let model = avatar {
            self.avatar.isHidden = false
            self.avatar.configuration(model: model)
        } else {
            self.avatar.isHidden = true
        }
        websiteButton.build(url: websiteUrl)
    }
}
