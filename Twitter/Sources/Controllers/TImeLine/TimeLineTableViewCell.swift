//
//  TImeLineTableViewCell.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/06.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import RealmSwift

class TimeLineTableViewCell: UITableViewCell {
    
    let realm = try! Realm()
    var tweetData: Results<TweetObject>!
//    var number: Int!
    
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var numberOfRetweets: UILabel!
    @IBOutlet weak var numberOfLikes: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tweetData = realm.objects(TweetObject.self)
    }
    
    func setData(indexPath: IndexPath) {
        let number = tweetData.count
        userName.text = tweetData[number - indexPath.row - 1].userName
        userID.text = tweetData[number - indexPath.row - 1].userID
        tweetText.text = tweetData[number - indexPath.row - 1].tweet
        numberOfLikes.text = String(tweetData[number - indexPath.row - 1].favoriteCount)
        numberOfRetweets.text = String(tweetData[number - indexPath.row - 1].retweetCount)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
