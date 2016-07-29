//
//  Networking.swift
//  Problem without Promise
//
//  Created by thinhvoxuan on 7/28/16.
//  Copyright © 2016 GEEKUp Company. All rights reserved.
//

import UIKit
import Alamofire

class Networking: NSObject {
    static let sharedInstance = Networking()
    
    func fetchConfig() -> Request {
        return Alamofire.request(.GET, "https://httpbin.org/get")
    }
    func fetchProfile() -> Request{
        return Alamofire.request(.GET, "https://httpbin.org/get")
    }
    func fetchAppVersion() -> Request{
        return Alamofire.request(.GET, "https://httpbin.org/get")
    }
}
