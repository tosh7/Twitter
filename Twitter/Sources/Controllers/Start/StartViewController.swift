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
            } else {
                print("error: \(String(describing: error?.localizedDescription))")
            }
        })

    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
        return TWTRTwitter.sharedInstance().application(app, open: url, options: options)
    }
    
    func getEmailAdress() {
//        let client = TWTRAPIClient.withCurrentUser()
//
//        client.requestEmail { email, error in
//            if (email != nil) {
//                print("signed in as \(session.userName)");
//            } else {
//                print("error: \(error.localizedDescription)");
//            }
//        }
    }
    
    
}