//
//  VNGRSTests.swift
//  VNGRSTests
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import XCTest
@testable import VNGRS


class VNGRSTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }


    func testPerformanceForObjects() {
        // This is an example of a performance test case.
        
        
        self.measure {
            // Put the code you want to measure the time of here.            
        }
    }
    
    func testParser() {
        
        // json
        let json = Mock.jakeWharton.json
        
        // class
        let user = parse(User.self, json: json)
        XCTAssertNil(user)
        
        // struct
        let entity = parse(UserEntity.self, json: json)
        XCTAssertNil(entity)
    }
    
    
    func parse<T: Codable>(_ type: T.Type, json: [String: Any]) -> T? {
        
        do {
            let jsonAsData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let decode = JSONDecoder()
            let object = try decode.decode(type, from: jsonAsData)
            
            return object
        } catch let error {
            debugPrint("error \(#function) catch \(error)")
        }
        
        return nil
    }

}




public struct UserEntity: Codable {
    
    var id: Int
    var login: String?
    var name: String?
    var avatarUrl: String?
    
    var numberOfPublicRepos: Int = 0
    var numberOfGists: Int = 0
    var numberOfFollowers: Int = 0
    var numberOfFollowings: Int = 0
    
    var blog: String?
    var bio: String?
    var location: String?
    var createdAt: String?
    var company: String?
    
    var followersUrl: String?
    var followingUrl: String?
    var gitstUrl: String?
    var reposUrl: String?
    var websiteUrl: String?
    
    //Custom Keys
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case name
        case avatarUrl = "avatar_url"
        
        case numberOfPublicRepos = "public_repos"
        case numberOfGists = "public_gists"
        case numberOfFollowers = "followers"
        case numberOfFollowings = "following"
        
        case blog
        case bio
        case location
        case createdAt = "created_at"
        case company
        
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gitstUrl = "gists_url"
        case reposUrl = "repos_url"
        case websiteUrl = "html_url"
        
    }
    
}



public class User: Codable {
    
    var id: Int
    var login: String?
    var name: String?
    var avatarUrl: String?
    
    var numberOfPublicRepos: Int = 0
    var numberOfGists: Int = 0
    var numberOfFollowers: Int = 0
    var numberOfFollowings: Int = 0
    
    var blog: String?
    var bio: String?
    var location: String?
    var createdAt: String?
    var company: String?
    
    var followersUrl: String?
    var followingUrl: String?
    var gitstUrl: String?
    var reposUrl: String?
    var websiteUrl: String?
    
    //Custom Keys
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case name
        case avatarUrl = "avatar_url"
        
        case numberOfPublicRepos = "public_repos"
        case numberOfGists = "public_gists"
        case numberOfFollowers = "followers"
        case numberOfFollowings = "following"
        
        case blog
        case bio
        case location
        case createdAt = "created_at"
        case company
        
        case followersUrl = "followers_url"
        case followingUrl = "following_url"
        case gitstUrl = "gists_url"
        case reposUrl = "repos_url"
        case websiteUrl = "html_url"
        
    }
}
