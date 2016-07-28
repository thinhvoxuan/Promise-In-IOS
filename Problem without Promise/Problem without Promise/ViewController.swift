//
//  ViewController.swift
//  Problem without Promise
//
//  Created by thinhvoxuan on 7/28/16.
//  Copyright © 2016 GEEKUp Company. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    let networking = Networking.sharedInstance
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.fetchInformation()
    }
    
    func fetchInformation() {
        networking.fetchAppVersion()
                .responseJSON(completionHandler: { (responseJSON) in
                self.networking.fetchConfig()
                    .responseJSON(completionHandler: { (responseJSON2) in
                        self.networking.fetchProfile()
                            .responseJSON(completionHandler: { (responseJSON3) in
                                print("\(responseJSON)")
                                print("\(responseJSON2)")
                                print("\(responseJSON3)")
                    })
                })
        })
    }
}

