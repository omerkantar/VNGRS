//
//  UserDetailComponent.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import RxGesture


class UserDetailComponent: UIView, QueerViewLoadable {

    // Avatar
    @IBOutlet weak var avatar: AvatarComponent!
    @IBOutlet weak var createdAtLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    
    // number of followings
    @IBOutlet weak var followingsStackView: AttributeStackView!
    @IBOutlet weak var followersStackView: AttributeStackView!
    @IBOutlet weak var gistsStackView: AttributeStackView!
    @IBOutlet weak var reposStackView: AttributeStackView!
    @IBOutlet weak var bioLabel: UILabel!
    
    var viewModel: UserDetailComponentViewModel?
    
    // initialize code
    override func awakeFromNib() {
        super.awakeFromNib()
        avatar.imageView.circle()
    }
    
    
    // MARK: - configuration
    override func configuration(model: Any?) {
        guard let vm = model as? UserDetailComponentViewModel else { return }
        self.viewModel = vm
        avatar.configuration(model: vm.avatar)
        createdAtLabel.text = vm.createdAtDate
        locationLabel.text = vm.model.location
        companyLabel.text = vm.model.company
        
        followersStackView.build(vm.followers)
        gistsStackView.build(vm.gists)
        followingsStackView.build(vm.following)
        reposStackView.build(vm.repositories)

        bioLabel.text = vm.model.bio ?? "None bio"
        bioLabel.numberOfLines = 0
        bioLabel.sizeToFit()

        self.bioLabel.layoutIfNeeded()
        self.layoutIfNeeded()
        self.updateConstraints()
    }
    
    
//    // MARK: - observe
//    func observe(stackView: AttributeStackView) {
//        // [unowned self] yapilabilir
//        tap(toView: stackView) { (tap) in
//            debugPrint("\(#function) stack view identifier: \(stackView.identifier ?? "nil")")
//        }
//    }
    
}
