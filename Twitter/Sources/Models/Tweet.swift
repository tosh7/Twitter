//
//  TimeLineModel.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/12.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import Foundation

struct Tweet: Codable {
    
    var user: User
    var text: String
    var favoriteCount: Int
    var retweetCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case user
        case text
        case favoriteCount = "favorite_count"
        case retweetCount = "retweet_count"
    }
}
