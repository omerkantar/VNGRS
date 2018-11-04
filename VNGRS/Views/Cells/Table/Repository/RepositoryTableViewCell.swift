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
    @IBOutlet weak var createdDateLabel: UILabel!
    @IBOutlet weak var ownerComponent: AvatarComponent!
    @IBOutlet weak var licenseLabel: UILabel!
    @IBOutlet weak var starStackView: AttributeStackView!

    
    var viewModel: RepositoryCellModel?
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        design()
    }
    
    // MARK: - Design
    func design() {
        languageStackView.imageView?.circle()
        ownerComponent.imageView.cornerRadius(12.0)
        ownerComponent.addUserDetailInteraction()
    }
    
    // Animation
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        let color: UIColor = highlighted ? .groupTableViewBackground : .white
        
        UIView.animate(withDuration: 0.2) {
            self.backgroundColor = color
        }
    }
    
    
    // MARK: - Configuration
    override func configuration(model: Any?) {
        guard let repository = model as? RepositoryCellModel else { return }
        
        self.viewModel = repository
        let model = repository.model
        titleLabel.text = model.name
        descriptionLabel.text = model.description

        ownerComponent.configuration(model: repository.avatarViewModel)
        createdDateLabel.text = repository.createdDate
        if let language = repository.language {
            languageStackView.build(text: language.title, imageColor: language.color)
        }
        starStackView.build(text: repository.stars?.title)
        self.licenseLabel.text = repository.model.license?.name

    }
    
    
    override func didSelect(model: Any?) {
        viewModel?.navigateRepositoryDetail()
    }
    
}
