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
    
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
        design()
    }

    
    
    // MARK: - Design
    func design() {
        languageStackView.imageView?.circle()
        owner.imageView.circle()

    }
    
    
    // MARK: - Configuration
    override func configuration(model: Any?) {
        guard let repository = model as? RepositoryCellModel else { return }
        let model = repository.model
        titleLabel.text = model.name
        descriptionLabel.text = model.description
        languageStackView.label?.text = model.language
        languageStackView.build(text: model.language ?? "", imageColor: .yellow, icon: nil)

        owner.imageView.loadUrl(model.owner?.avatarUrl)
        owner.nameLabel.text = model.owner?.login
        updatedDateLabel.text = nil
    }
    
}
