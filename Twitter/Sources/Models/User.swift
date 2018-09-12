//
//  File.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/12.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    
    var name: String!
    var userScreenName: String!
    
    init(json: JSON){
        self.userName = json["name"].stringValue
        self.userScreenName = json["screen_name"].stringValue
    }
}
