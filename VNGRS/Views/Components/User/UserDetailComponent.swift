//
//  UserDetailComponent.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import RxGesture

class UserDetailComponent: UIView {

    @IBOutlet weak var userComponent: UserComponent!
    
    // number of followings
    @IBOutlet weak var numberOfFollowingStackView: AttributeStackView!
    @IBOutlet weak var numberOfFollowersStackView: AttributeStackView!
    @IBOutlet weak var numberOfGistsStackView: AttributeStackView!
    
    
    // initialize code
    override func awakeFromNib() {
        super.awakeFromNib()
        [numberOfFollowingStackView,
         numberOfFollowersStackView,
         numberOfGistsStackView].forEach { (stackView) in
            self.observe(stackView: stackView)
        }
    }
    
    
    // MARK: -
    
    
    // MARK: - observe
    func observe(stackView: AttributeStackView) {
        // [unowned self] yapilabilir
        tap(toView: stackView) { (tap) in
            debugPrint("\(#function) stack view identifier: \(stackView.identifier ?? "nil")")
        }
    }
    
}
