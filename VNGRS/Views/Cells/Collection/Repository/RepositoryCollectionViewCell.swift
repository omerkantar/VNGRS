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
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowRadius = 5.0
        self.layer.shadowOpacity = 0.5
        self.clipsToBounds = false
        container.layer.borderColor = UIColor.lightGray.cgColor
        container.layer.borderWidth = 0.25
        container.layer.cornerRadius = 8.0
        container.layer.masksToBounds = true
        
        languageAttributeStackView.imageView?.circle()
    }

    
    // MARK: - Configuration
    override func configuration(model: Any?) {
        guard let vm = model as? RepositoryCellModel else { return }
        let repository = vm.model
        self.viewModel = vm
        nameLabel.text = repository.name
        createAtLabel.text = vm.createdDate
        descriptionLabel.text = repository.description ?? "None description"
        licenseLabel.text = repository.license?.name
        languageAttributeStackView.build(text: vm.language?.title, imageColor: vm.language?.color)
        starsAttributeStackView.build(text: vm.stars?.title)
    }
    
    
    // MARK: - Highligted
    override var isHighlighted: Bool {
        didSet {
            var scale: CGFloat = 1.0
            var radius: CGFloat = 5.0
            if isHighlighted {
                radius = 1.0
                scale = 0.98
            }
            
            UIView.animate(withDuration: 0.3) {
                self.layer.shadowRadius = radius
                self.container.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
    }
    
    // MARK: - Did set
    override func didSelect(model: Any?) {
         viewModel?.navigateRepositoryDetail()
    }
}
