//
//  UserComponent.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

protocol AvatarComponentDataSource {
    var title: String { set get }
    var imageUrl: String? { set get }
}

class AvatarComponent: UIView {

    // Repository ile ortak olan interface builder outlets
    @IBOutlet weak var imageView: ImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    // Initialize
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    override func configuration(model: Any?) {
        guard let dataSource = model as? AvatarComponentDataSource else { return }
        
        nameLabel.text = dataSource.title
        imageView.loadUrl(dataSource.imageUrl)
    }
    
    
}
