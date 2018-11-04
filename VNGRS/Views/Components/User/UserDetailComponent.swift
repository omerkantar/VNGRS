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

    // Avatar
    @IBOutlet weak var avatar: AvatarComponent!
    
    // number of followings
    @IBOutlet weak var numberOfFollowingStackView: AttributeStackView!
    @IBOutlet weak var numberOfFollowersStackView: AttributeStackView!
    @IBOutlet weak var numberOfGistsStackView: AttributeStackView!
    
    @IBOutlet weak var bioLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
    
    var viewModel: UserDetailComponentViewModel?
    
    // initialize code
    override func awakeFromNib() {
        super.awakeFromNib()
        [numberOfFollowingStackView,
         numberOfFollowersStackView,
         numberOfGistsStackView].forEach { (stackView) in
            self.observe(stackView: stackView)
        }
    }
    
    
    // MARK: - configuration
    override func configuration(model: Any?) {
        guard let vm = model as? UserDetailComponentViewModel else { return }
        
        avatar.configuration(model: vm.avatar)
        
    }
    
    
    // MARK: - observe
    func observe(stackView: AttributeStackView) {
        // [unowned self] yapilabilir
        tap(toView: stackView) { (tap) in
            debugPrint("\(#function) stack view identifier: \(stackView.identifier ?? "nil")")
        }
    }
    
}
