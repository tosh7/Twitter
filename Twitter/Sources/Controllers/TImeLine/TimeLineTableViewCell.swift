//
//  TImeLineTableViewCell.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/06.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit

class TimeLineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var tweet: UITextView!{
        didSet {
            tweet.isEditable = false
        }
    }
    @IBOutlet weak var numberOfRetweets: UILabel!
    @IBOutlet weak var numberOfLikes: UILabel!

    func setup(tweet: Timelines.TweetData) {
        userID.text = tweet.id
        self.tweet.text = tweet.text
    }
}
