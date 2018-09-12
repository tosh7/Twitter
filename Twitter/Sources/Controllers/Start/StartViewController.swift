//
//  StartViewController.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/07.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import TwitterKit
import TwitterCore
import SwiftyJSON
import RealmSwift

class StartViewController: UIViewController {
    
    let realm = try! Realm()
    
    var tweets: [Tweet] = []
    var userInfo: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(String(describing: session?.userName))")
            } else {
                print("error: \(String(describing: error?.localizedDescription))");
            }
        })
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
        
        
        TWTRTwitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                print("signed in as \(String(describing: session?.userName))")
                
                var clientError: NSError?
                
                let apiClient = TWTRAPIClient(userID: session?.userID)
                let request = apiClient.urlRequest(
                    withMethod: "GET",
                    urlString: "https://api.twitter.com/1.1/statuses/home_timeline.json",
                    parameters: [
                        "user_id": session?.userID as Any,
                        "count": "10",
                        ],
                    error: &clientError
                )
                
                apiClient.sendTwitterRequest(request) { response, data, error in // NSURLResponse?, NSData?, NSError?
                    if let error = error {
                        print(error.localizedDescription)
                    } else if let data = data, let json = String(data: data, encoding: .utf8) {
                        print("")
                        print("")
                        print("")
                        print(json)
                        self.tweets = JSONParser.parse(data: data)
                        
                        for i in 0...9 {
                            let realmData = TweetObject()
                            
                            realmData.userName = (self.tweets[9 - i].user?.name)!
                            realmData.userID = (self.tweets[9 - i].user?.userScreenName)!
                            realmData.tweet = (self.tweets[9 - i].text)!
                            realmData.favoriteCount = (self.tweets[9 - i].favoriteCount)!
                            realmData.retweetCount = (self.tweets[9 - i].retweetCount)!
                            
                            try! self.realm.write {
                                self.realm.add(realmData)
                            }
                        }
                        print((self.tweets[0].text)!)
                        print((self.tweets[0].user?.name)!)
                    }
                }
                
//                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    // 0.5秒後に実行したい処理
                    self.performSegue(withIdentifier: "toTimeLine", sender: nil)
//                }
                
            } else {
                print("error: \(String(describing: error?.localizedDescription))")
            }
            
            
        })
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }
}
