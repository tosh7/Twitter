//
//  JSONParser.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/12.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import Foundation

struct JSONParser {
    static func parse(data: Data) -> [Tweet] {
        
        var tweets:[Tweet] = []
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            tweets = try jsonDecoder.decode([Tweet].self, from: data)
        } catch {
            print(error.localizedDescription)
        }
        return tweets
    }
}
