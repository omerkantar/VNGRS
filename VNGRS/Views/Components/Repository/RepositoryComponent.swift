//
//  RepositoryComponent.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit


class RepositoryComponent: UIView {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var avatarComponent: AvatarComponent!
    @IBOutlet weak var numberOfForksStackView: AttributeStackView!
    @IBOutlet weak var numberOfStarsStackView: AttributeStackView!
    @IBOutlet weak var languageStackView: AttributeStackView!
    @IBOutlet weak var defaultBranchNameStackView: AttributeStackView!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarComponent.addUserDetailInteraction()
        
    }
    
    func configuration(viewModel: RepositoryDetailViewModel) {
        
    }
}
