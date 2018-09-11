//
//  TImeLineTableViewCell.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/06.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit

class TImeLineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userID: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    @IBOutlet weak var numberOfRetweets: UILabel!
    @IBOutlet weak var numberOfLikes: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        userName.text = "userName"
        userID.text = "UserID"
        tweetText.text = "Tweet"
        numberOfLikes.text = "3"
        numberOfRetweets.text = "6"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
