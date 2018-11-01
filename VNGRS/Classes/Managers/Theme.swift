//
//  Theme.swift
//  VNGRS
//
//  Created by omer kantar on 31.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import UIKit

enum Theme: Int {
    case light = 1
    case dark = 2
}

struct ThemeManager {
    
    private static var manager = ThemeManager()
    
    private var current: Theme = .light
    
    init() {
        if let value = UserDefaults.get(forKey: .theme) as? Int, let theme = Theme(rawValue: value),
            ThemeManager.current() != theme {
            current = theme
            
        }
    }
    
    static func toogle() {
        let theme: Theme
        switch manager.current {
        case .dark:
            theme = .light
        case .light:
            theme = .dark
        }
        manager.current = theme
        UserDefaults.set(theme.rawValue, forKey: .theme)
    }
    
    static func current() -> Theme {
        return manager.current
    }
}

// TODO: UserDefaults+Key.swift dosyasi yap
extension UserDefaults {
    
    enum Key: String {
        case theme = "themeKey"
    }
    
    @discardableResult
    static func set(_ value: Any?, forKey key: Key) -> Bool {
        let current = UserDefaults.standard
        current.set(value, forKey: key.rawValue)
        return current.synchronize()
    }
    
    static func get(forKey key: Key) -> Any? {
        return UserDefaults.standard.object(forKey: key.rawValue)
    }
    
}
