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
    
    
    func fetchHomeFeed(completion: @escaping (HomeDataSource?, Error?) -> ()) {
        
        // Start JSON fetch
        let request: APIRequest<HomeDataSource, JSONError> = tron.request("/twitter/home")
        
        request.perform(withSuccess: { (homeDataSource) in
            completion(homeDataSource, nil)
        }) { (err) in
            completion(nil, err)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON ERROR")
        }
    }
}
