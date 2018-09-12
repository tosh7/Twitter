//
//  TweetObject.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/13.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import Foundation
import RealmSwift

class TweetObject: Object {
    
    @objc dynamic var userName = ""
    @objc dynamic var userID = ""
    @objc dynamic var tweet = ""
    @objc dynamic var favoriteCount = 0
    @objc dynamic var retweetCount = 0
    
}
