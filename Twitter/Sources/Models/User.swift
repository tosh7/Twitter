//
//  File.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/12.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import Foundation
import SwiftyJSON

struct User {
    
    var name: String!
    var userScreenName: String!
    var iconImageURL: String!
    
    init(json: JSON){
        self.name = json["name"].stringValue
        self.userScreenName = json["screen_name"].stringValue
        self.iconImageURL = json["profile_image_url_https"].stringValue
    }
}
