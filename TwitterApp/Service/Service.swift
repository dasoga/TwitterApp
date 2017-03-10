//
//  Service.swift
//  TwitterApp
//
//  Created by Dante Solorio on 3/9/17.
//  Copyright © 2017 iOS México School. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    
    static let sharedInstance = Service()
    
    
    func fetchHomeFeed(completion: @escaping (HomeDataSource) -> ()) {
        
        // Start JSON fetch
        let request: APIRequest<HomeDataSource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDataSource) in
            completion(homeDataSource)
        }) { (err) in
            print("Failed to fetch json...",err)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
}
