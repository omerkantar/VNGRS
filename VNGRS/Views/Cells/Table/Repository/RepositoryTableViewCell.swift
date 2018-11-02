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
    @IBOutlet weak var ownerComponent: AvatarComponent!
    
    var viewModel: RepositoryCellModel?
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
        design()
    }

    
    
    // MARK: - Design
    func design() {
        languageStackView.imageView?.circle()
        ownerComponent.imageView.cornerRadius(12.0)
        ownerComponent.addUserDetailInteraction()
        
        languageStackView.isHidden = true
        
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor.groupTableViewBackground
        selectedBackgroundView = view
    }
    
    
    // MARK: - Configuration
    override func configuration(model: Any?) {
        guard let repository = model as? RepositoryCellModel else { return }
        
        self.viewModel = repository
        let model = repository.model
        titleLabel.text = model.name
        descriptionLabel.text = model.description

        ownerComponent.configuration(model: repository.avatarViewModel)
        updatedDateLabel.text = repository.model.createdAt
        languageStackView.isHidden = true

        if let lang = repository.language {
            languageStackView.isHidden = false
            languageStackView.label?.text = lang.rawValue
            languageStackView.build(text: lang.rawValue, imageColor: lang.color, icon: nil)
        }
    }
    
    
    override func didSelect(model: Any?) {
        viewModel?.navigateRepositoryDetail()
    }
    
}
