//
//  File.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/12.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import Foundation

struct User: Codable {
    
    var name: String
    var screenName: String?
    var profileImageUrlHttps: String?
    
}
