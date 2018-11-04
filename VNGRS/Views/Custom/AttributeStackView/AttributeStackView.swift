//
//  AttributeLabel.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit


// Image gelebilir, label olur.
// Forks, Stars, Watching icon&emoji bulamadim 🙈

class AttributeStackView: UIStackView {

    @IBOutlet weak var imageView: ImageView?
    @IBOutlet weak var label: UILabel?

    // identifier verilmesi
    var identifier: Any? = nil
    
    private var viewModel: AttributeStackViewModel?
    
    private var websiteUrl: String?
    
    // Awake from nib
    override func awakeFromNib() {
        super.awakeFromNib()
        label?.textColor = UIColor.gray
        label?.font = UIFont.systemFont(ofSize: 12.0, weight: .semibold)
        
        tap(toView: self) { [weak self] (gr) in
            WebsiteButton.tapped(url: self?.websiteUrl)
        }
    }
    
    func build(text: String? = nil,
               imageColor: UIColor? = nil,
               icon: UIImage? = nil) {
        
        label?.text = text
        if let color = imageColor {
            imageView?.backgroundColor = color
        }
        imageView?.image = icon        
        self.isHidden = (text == nil && imageColor == nil && icon == nil)
    }
    
    func build(_ builder: AttributeStackViewModel) {
        
        build(text: builder.title, imageColor: builder.color, icon: nil)
        self.websiteUrl = builder.webUrl
    }
    
}
