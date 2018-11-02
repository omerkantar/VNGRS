//
//  WindowManager.swift
//  VNGRS
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

class WindowManager: NSObject {

    
    static func applicationDidFinishLaunchOptions() {
        
        let delegate = appDelegate()
        delegate.window = UIWindow(frame: UIScreen.main.bounds)
        delegate.window?.backgroundColor = .black
        delegate.window?.layer.masksToBounds = true
        delegate.window?.layer.cornerRadius = 4.0
        delegate.window?.rootViewController = UIViewController.fromNavigationController(identifier: .search)
        
        delegate.window?.makeKeyAndVisible()
    }
    
    
    
    private static func appDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    // root view controller olusturulacak
    static func searchViewController() -> SearchViewController? {
        //
        let nc = appDelegate().window?.rootViewController as? UINavigationController
        // search ilk eleman olacak
        let vc = nc?.viewControllers.first
        
        guard vc is SearchViewController else {
            // hata yazsin
            debugPrint("root view controller is not Search view controller \(#function)")
            return nil
        }
        return vc as? SearchViewController
    }
    
    static func rootViewController() -> UINavigationController? {
        return appDelegate().window?.rootViewController as? UINavigationController
    }
}
