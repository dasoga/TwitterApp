//
//  HomeDataSource.swift
//  TwitterApp
//
//  Created by Dante Solorio on 1/7/17.
//  Copyright © 2017 iOS México School. All rights reserved.
//

import LBTAComponents

class HomeDataSource: Datasource {
    
    let users: [User] = {
        let user1 = User(name: "iOS Mexico School", username: "@iosmexschool", bioText: "Mexican School iOS programming, learn Swift an play with new frameworks", profileImage: #imageLiteral(resourceName: "profileImage"))
        let user2 = User(name: "User Two", username: "@usertwo", bioText: "This is the bio for user two in text view.This is the bio for user two in text view.This is the bio for user two in text view.This is the bio for user two in text view.", profileImage: #imageLiteral(resourceName: "profileImage"))
        
        return [user1, user2]
    }()
    
    let tweets: [Tweet] = {
        let user1 = User(name: "iOS Mexico School", username: "@iosmexschool", bioText: "Mexican School iOS programming, learn Swift an play with new frameworks", profileImage: #imageLiteral(resourceName: "profileImage"))
        
        let tweet = Tweet(user: user1, message: "Welcome to episode 9 and more lalala more text lalalalalala Welcome to episode 9 and more lalala more text lalalalalala Welcome to episode 9 and more lalala more text lalalalalala Welcome to episode 9 and more lalala more text lalalalalala")
        let tweet2 = Tweet(user: user1, message: "Welcome to episode 9 and more lalala more text lalalalalala Welcome to episode 9 and more lalala more text lalalalalala Welcome to episode 9 and more lalala more text lalalalalala Welcome to episode 9 and more lalala more text lalalalalala")
        
        return [tweet, tweet2]
    }()
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1{
            return tweets.count
        }
        return users.count
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1{
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
}
