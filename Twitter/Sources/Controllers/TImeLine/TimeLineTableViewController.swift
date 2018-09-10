//
//  TableViewController.swift
//  Twitter
//
//  Created by Satoshi Komatsu on 2018/09/06.
//  Copyright © 2018年 Satoshi Komatsu. All rights reserved.
//

import UIKit
import TwitterKit


class TImeLineTableViewController: TWTRTimelineViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = TWTRUserTimelineDataSource(screenName: "tosh_lit", apiClient: TWTRAPIClient())
    }
}
