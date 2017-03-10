//
//  Tweet.swift
//  TwitterApp
//
//  Created by Dante Solorio on 2/2/17.
//  Copyright © 2017 iOS México School. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
}
