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
//
        let number = tweetData.count + 1
        userName.text = tweetData[number - self.tag].userName
    }
    
//    func setData(indexPath: IndexPath) {
////        let number = tweetData.count
//        let number = 20
//        userName.text = tweetData[number - self.tag].userName
//    }
////
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
