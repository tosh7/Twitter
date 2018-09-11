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

class StartViewController: UIViewController {
    
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
                self.performSegue(withIdentifier: "toTimeLine", sender: nil)
                
            } else {
                print("error: \(String(describing: error?.localizedDescription))")
            }
            
            var clientError: NSError?
            
            let apiClient = TWTRAPIClient(userID: session?.userID)
            let request = apiClient.urlRequest(
                withMethod: "GET",
                urlString: "https://api.twitter.com/1.1/statuses/home_timeline.json",
                parameters: [
                    "user_id": session?.userID,
                    "count": "1", // Intで10を渡すとエラーになる模様で、文字列にしてやる必要がある
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
                }
            }
        })

    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }
}
