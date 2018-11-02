//
//  RepositoryTableViewCell.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit


class RepositoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageStackView: AttributeStackView!
    @IBOutlet weak var updatedDateLabel: UILabel!
    @IBOutlet weak var owner: AvatarComponent!
    
    var viewModel: RepositoryCellModel?
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
        design()
    }

    
    
    // MARK: - Design
    func design() {
        languageStackView.imageView?.circle()
        owner.imageView.cornerRadius(12.0)
        owner.addUserDetailInteraction()
        languageStackView.isHidden = true
    }
    
    
    // MARK: - Configuration
    override func configuration(model: Any?) {
        guard let repository = model as? RepositoryCellModel else { return }
        let model = repository.model
        titleLabel.text = model.name
        descriptionLabel.text = model.description

        owner.imageView.loadUrl(model.owner?.avatarUrl)
        owner.nameLabel.text = model.owner?.login
        updatedDateLabel.text = repository.model.createdAt
        languageStackView.isHidden = true

        if let lang = repository.language {
            languageStackView.isHidden = false
            languageStackView.label?.text = lang.rawValue
            languageStackView.build(text: lang.rawValue, imageColor: lang.color, icon: nil)
        }
    }
    
}
