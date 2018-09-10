//
//  TwitterAPI.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/08.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import Foundation
import TwitterKit

class TwitterAPI {
    
    let baseURL = "https://api.twitter.com"
    let version = "/1.1"
    
    init() {
        
    }
    
    class func getHomeTimeline(user:String?, tweets: @escaping ([TWTRTweet]) -> (), error: @escaping (NSError) -> ()) {
        let client = TWTRAPIClient(userID: user)
        var clientError: NSError?
        let api = TwitterAPI()
        let path = "/statuses/home_timeline.json"
        let endpoint = api.baseURL + api.version + path
        let request:NSURLRequest? = client.urlRequest(withMethod: "GET", urlString: endpoint, parameters: nil, error: &clientError) as NSURLRequest?
        
        if request != nil {
            client.sendTwitterRequest(request! as URLRequest, completion: {
                response, data, err in
                if err == nil {
                    var jsonError: NSError?
                    let json:AnyObject? = try! JSONSerialization.jsonObject(with: data!) as AnyObject?
                    if let jsonArray = json as? NSArray {
                        tweets(TWTRTweet.tweets(withJSONArray: jsonArray as! [Any]) as! [TWTRTweet])
                    }else{
                        error(err as! NSError)
                    }
                }else{
                    print("request error: \(err)")
                }
            })
        }
    }
    
}
