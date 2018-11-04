//
//  RepositoryComponent.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit


class RepositoryComponent: UIView {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageStackView: AttributeStackView!
    @IBOutlet weak var createAtLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!

    @IBOutlet weak var avatarComponent: AvatarComponent!
    @IBOutlet weak var forksStackView: AttributeStackView!
    @IBOutlet weak var starsStackView: AttributeStackView!
    @IBOutlet weak var watchesStackView: AttributeStackView!
    @IBOutlet weak var defaultBranchNameStackView: AttributeStackView!
    @IBOutlet weak var websiteButton: WebsiteButton!
    
    
    var viewModel: RepositoryDetailViewModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarComponent.imageView.circle()
        avatarComponent.addUserDetailInteraction()
        languageStackView.imageView?.circle()
        
    }
    
    func build(viewModel: RepositoryDetailViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.model.name
        createAtLabel.text = viewModel.model.createdAt?.dateString
        descriptionTitleLabel.text = "Description"
        descriptionLabel.text = viewModel.model.description
        
        avatarComponent.configuration(model: viewModel.avatarViewModel)
        languageStackView.build(text: viewModel.language?.title, imageColor: viewModel.language?.color)
        defaultBranchNameStackView.build(text: viewModel.defaultBranch)
        forksStackView.build(text: viewModel.numberOfForks)
        starsStackView.build(text: viewModel.numberOfStars)
        watchesStackView.build(text: viewModel.numberOfWatchers)
        websiteButton.build(url: viewModel.model.homepageUrl)
    }
}
