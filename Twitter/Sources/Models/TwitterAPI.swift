//
//  TwitterAPI.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2019/04/25.
//  Copyright © 2019 Satoshi Komatsu. All rights reserved.
//

import Foundation
import TwitterKit

struct TwitterAPI {
    
    static var userId: String!
    static var apiClient: TWTRAPIClient!
    static var request: URLRequest!
    
    static func setUp () {
        apiClient = TWTRAPIClient(userID: userId!)
        
        request = apiClient.urlRequest(
            withMethod: "GET",
            urlString: "https://api.twitter.com/1.1/statuses/home_timeline.json",
            parameters: [
                "user_id": session?.userID as Any,
                "count": "11",
            ],
            error: &clientError
        )
    }
    
}
