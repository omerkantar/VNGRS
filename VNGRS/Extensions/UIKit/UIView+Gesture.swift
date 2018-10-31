//
//  UIView+Gesture.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit
import RxGesture

extension UIView {
    func tap(toView: UIView, action: @escaping (_ tap: UIGestureRecognizer) -> Void) {
        toView.rx
            .anyGesture(.tap())
            .when(.recognized)
            .subscribe(onNext: { gesture in
                action(gesture)
            }).dispose()
    }
}
