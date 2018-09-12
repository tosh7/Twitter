//
//  TimeLineModel.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/12.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import Foundation
import SwiftyJSON

class Tweet {
    
    var user: User?
    var text: String!
    var favoriteCount: Int!
    var retweetCount: Int!
    
    init(json: JSON) {
        self.user = User(json: json["user"])
        self.text = json["text"].stringValue
        self.favoriteCount = json["favorite_count"].intValue
        self.retweetCount = json["retweet_count"].intValue
    }
}
