//
//  String+Extensions.swift
//  VNGRS
//
//  Created by omer kantar on 2.11.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import Foundation


extension String {
    var dateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        guard let date = formatter.date(from: self) else { return "" }
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
}

extension Int {
    private func numberOf(item: String) -> String? {
        return self > 0 ? "\(item) \(self)" : nil
    }
    
    var numberOfForks: String? {
        return self > 0 ? numberOf(item: "Forks:") : nil
    }
    
    var numberOfStars: String? {
        return self > 0 ? numberOf(item: "Stars:") : nil
    }
    
    var numberOfWatchers: String? {
        return self > 0 ? numberOf(item: "Watchers:") : nil
    }
    
    var numberOfFollowings: String? {
        return self > 0 ? numberOf(item: "Followings:") : nil
    }
    
    var numberOfFollowers: String? {
        return self > 0 ? numberOf(item: "Followers:") : nil
    }
    
    var numberOfGists: String? {
        return self > 0 ? numberOf(item: "Gists:") : nil
    }
    
    var numberOfRepositories: String? {
        return self > 0 ? numberOf(item: "Repositories:") : nil
    }
    
}
