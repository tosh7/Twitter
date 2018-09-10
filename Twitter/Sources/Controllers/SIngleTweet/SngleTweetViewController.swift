//
//  SngleTweetViewController.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/08.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import TwitterKit

class SngleTweetViewController: UIViewController {
    
    var tweetView = TWTRTweetView?.self
    let client = TWTRAPIClient()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        client.loadTweet(withID: "20") { [weak self] (tweet, error) in
//            if let t = tweet{
//                if let tweetView = self?.tweetView {
//                    tweetView.configure(with: t)
//                } else {
//                    self?.tweetView = TWTRTweetView(tweet: t, style: TWTRTweetViewStyle.regular)
//                }
//            } else {
//                print("Failed to load Tweet: \(error.localizedDescription)")
//            }
//        }
    }
    
}
