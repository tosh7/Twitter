//
//  TableViewController.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/06.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import TwitterKit
import RealmSwift

class TimeLineTableViewController: UITableViewController {
    
    let realm = try! Realm()
    var tweetData: Results<TweetObject>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "TimeLineTableViewCell", bundle: nil),
                           forCellReuseIdentifier: "TweetCell")
        tableView.rowHeight = 166
        
        tweetData = realm.objects(TweetObject.self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell") as! TimeLineTableViewCell
        // セルに値を設定
        let rowNumber = tweetData.count - indexPath.row - 1
        
        guard  let _tweetData = tweetData else {
            print("error")
            return cell
        }
    
        let image = UIImage(data: _tweetData[rowNumber].iconImageData!)
        cell.iconImage.image = image
        cell.userName.text = _tweetData[rowNumber].userName
        cell.userID.text = _tweetData[rowNumber].userID
        cell.tweet.text = _tweetData[rowNumber].tweet
        cell.numberOfLikes.text = "\(_tweetData[rowNumber].favoriteCount) Likes"
        cell.numberOfRetweets.text = "\(_tweetData[rowNumber].retweetCount) Retweets"
        
        return cell
    }
}
