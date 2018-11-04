//
//  StatusBarProgress.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

extension StatusBarProgress {
    public enum Const {
        static var showing: Bool = true
        static var color: UIColor = .blue
    }
}

// Status barin oldugu tarafta progress olmasi
// ancak progress hep 0.0 gelmektedir o nedenle animation ekledim
//
class StatusBarProgress: UIView {
    
    private var animating: Bool = false
    
    // MARK: - Start
    func show() {
        guard Const.showing else { return }
        setup()
        self.backgroundColor = Const.color
    }
    
    func hide() {
        UIView.animate(withDuration: 1.0, animations: {
            self.frame.origin.x = 0.0
        }) { (_) in
            self.removeFromSuperview()
        }
    }
    
    func animated(progress: Double) {
        let ratio = Double(min(1.0, max(progress, 0.0)))
        animating(progress: ratio)
    }
    
    private var currentProgress: Double {
        let originX = CGFloat(abs(self.frame.origin.x))
        let width = self.frame.size.width
        return Double((width - originX) / width)
    }
    
    // MARK: - Animating
    private func animating(progress: Double) {
        if animating {
            return
        }
        animating = true
        var ratio: Double = progress
        if ratio == 0.0 {
            ratio = 0.33
        }
        let width = self.frame.width
        let current = currentProgress
        if current > ratio {
            ratio += current
        }
        ratio = min(1.0, ratio)
        let originX = (width * CGFloat(ratio)) - width
        UIView.animate(withDuration: 1.0, animations: {
            self.frame.origin.x = originX
        }) { (_) in
            self.animating = false
        }
    }
    
    // MARK: - Setup
    private func setup() {
        guard let window = appWindow else { return }
        let inset = window.safeAreaInsets
        let size = window.bounds.size
        
        self.frame = CGRect(x: -size.width, y: 0.0, width: size.width, height: inset.top)
        
        window.addSubview(self)
    }
    
    private var appWindow: UIWindow? {
        return (UIApplication.shared.delegate as? AppDelegate)?.window
    }
}
