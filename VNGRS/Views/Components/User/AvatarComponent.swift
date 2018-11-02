//
//  UserComponent.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import RxGesture

protocol AvatarComponentDataSource {
    var title: String { set get }
    var imageUrl: String? { set get }
}



class AvatarComponent: UIView {

    // Repository ile ortak olan interface builder outlets
    @IBOutlet weak var imageView: ImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var dataSource: AvatarComponentDataSource?
    
    // Initialize
    override func awakeFromNib() {
        super.awakeFromNib()
        imageView.contentMode = .scaleAspectFit
    }
    
    override func configuration(model: Any?) {
        guard let dataSource = model as? AvatarComponentDataSource else { return }
        
        self.dataSource = dataSource
        nameLabel.text = dataSource.title
        imageView.loadUrl(dataSource.imageUrl)
    }
    
    
    func addUserDetailInteraction() {
        
        guard let title = dataSource?.title else { return }
        imageView.rx.tapGesture().when(.recognized).subscribe(onNext: { _ in
                Router.navigate(.userDetail(name: title))
            }).dispose()
    }
    
    
    
}
