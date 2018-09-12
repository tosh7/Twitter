//
//  JSONParser.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/12.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JSONParser {
    static func parse(data: Data) -> [Tweet] {
        print("parse start!")
        let json = JSON(data)
        
        let timeline: [Tweet] = json.arrayValue.map({ Tweet(json: $0) })
        
        return timeline
    }
}
