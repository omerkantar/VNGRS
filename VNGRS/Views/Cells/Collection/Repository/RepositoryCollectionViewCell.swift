//
//  RepositoryCollectionViewCollectionViewCell.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

// Profilinde olacagi icin avatar olmayacak
//
class RepositoryCollectionViewCell: UICollectionViewCell {


    @IBOutlet weak var container: UIView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var createAtLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!
    @IBOutlet weak var languageAttributeStackView: AttributeStackView!
    @IBOutlet weak var starsAttributeStackView: AttributeStackView!


    var viewModel: RepositoryCellModel?
    
    // Initialization code
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.5
        
        container.layer.cornerRadius = 20.0
        container.layer.masksToBounds = true
        
    }

    
    // MARK: - Configuration
    override func configuration(model: Any?) {
        guard let vm = model as? RepositoryCellModel else { return }
        let repository = vm.model
        self.viewModel = vm
        nameLabel.text = repository.name
        createAtLabel.text = vm.createdDate
        descriptionLabel.text = repository.description
        licenseLabel.text = repository.license?.name
        languageAttributeStackView.build(text: vm.language?.title, imageColor: vm.language?.color)
        starsAttributeStackView.build(text: vm.stars?.title)
        
    }
    
    
    // MARK: - Highligted
    override var isHighlighted: Bool {
        didSet {
            let scale: CGFloat = isHighlighted ? 0.9 : 1.0
            UIView.animate(withDuration: 0.3) {
                self.container.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
    }
    
    // MARK: - Did set
    override func didSelect(model: Any?) {
         viewModel?.navigateRepositoryDetail()
    }
}
