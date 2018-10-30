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
        
        
    }
    
    
    
    private static func appDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    // root view controller olusturulacak
    static func rootViewController() -> SearchViewController? {
        let nc = appDelegate().window?.rootViewController as? UINavigationController
        let vc = nc?.viewControllers.first
        
        guard vc is SearchViewController else {
            // hata yazsin
            debugPrint("root view controller is not Search view controller \(#function)")
            return nil
        }
        return vc as? SearchViewController
    }
}
