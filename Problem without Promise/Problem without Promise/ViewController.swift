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
    
    func fetchInformationWithErrorhandler() {
        networking.fetchAppVersion()
            .responseJSON(completionHandler: { (responseJSON) in
                switch responseJSON.result {
                case .Success(let value1):
                    self.fetchConfigAPI(value1)
                case .Failure(let error):
                    print(error)
                }
            })
    }
    
    func fetchConfigAPI(value1: AnyObject) {
        self.networking.fetchConfig()
            .responseJSON(completionHandler: { (responseJSON2) in
                switch responseJSON2.result {
                case .Success(let value2):
                    self.fetchProfileAPI(value1, value2: value2)
                case .Failure(let error):
                    print(error)
                }
            })
    }
    
    func fetchProfileAPI(value1: AnyObject, value2: AnyObject) {
        self.networking.fetchProfile()
            .responseJSON(completionHandler: { (responseJSON3) in
                switch responseJSON3.result {
                case .Success(let value3):
                    print("\(value1)")
                    print("\(value2)")
                    print("\(value3)")
                case .Failure(let error):
                    print(error)
                }
            })
    }
}

