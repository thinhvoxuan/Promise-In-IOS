//
//  Networking.swift
//  Promise Future Example
//
//  Created by thinhvoxuan on 7/29/16.
//  Copyright © 2016 GEEKUp Company. All rights reserved.
//

import UIKit
import BoltsSwift
import Alamofire

struct ROUTE {
    static let ROOT_URL = "http://localhost:3000"
    static let CONFIG = ROUTE.ROOT_URL + "/config"
    static let PROFILE = ROUTE.ROOT_URL + "/profile"
    static let VERSION = ROUTE.ROOT_URL + "/version"
    static let httpBin = "https://httpbin.org/get"
    static let emptyLink = "https://dont.thinhvoxuan.me/get"
}

class Networking: NSObject {
    static let sharedInstance = Networking()
    
    func fetchConfig() -> Request {
        return Alamofire.request(.GET, ROUTE.httpBin)
    }
    
    func fetchConfigBF() -> Task<AnyObject> {
        let task = TaskCompletionSource<AnyObject>()
        Alamofire.request(.GET, ROUTE.httpBin)
            .validate()
            .responseJSON {response in
                switch response.result {
                case .Success(let value):
                    task.set(result: value)
                    break
                case .Failure(let error):
                    task.set(error: error)
                }
        }
        return task.task;
    }
    
    func fetchConfigBFMustFailed() -> Task<AnyObject> {
        let task = TaskCompletionSource<AnyObject>()
        Alamofire.request(.GET, ROUTE.emptyLink)
            .validate()
            .responseJSON {response in
                switch response.result {
                case .Success(let value):
                    task.set(result: value)
                    break
                case .Failure(let error):
                    task.set(error: error)
                }
        }
        return task.task;
    }
    
    func fetchProfile() -> Request{
        return Alamofire.request(.GET, ROUTE.httpBin)
    }
    
    func fetchProfileBF() -> Task<AnyObject>{
        let task = TaskCompletionSource<AnyObject>()
        Alamofire.request(.GET, ROUTE.httpBin)
            .validate()
            .responseJSON {response in
                switch response.result {
                case .Success(let value):
                    task.set(result: value)
                    break
                case .Failure(let error):
                    task.set(error: error)
                }
        }
        return task.task;
    }
    
    func fetchAppVersion() -> Request{
        return Alamofire.request(.GET, ROUTE.httpBin)
    }
    
    func fetchAppVersionBF() -> Task<AnyObject>{
        let task = TaskCompletionSource<AnyObject>()
        Alamofire.request(.GET, ROUTE.httpBin)
            .validate()
            .responseJSON {response in
                switch response.result {
                case .Success(let value):
                    task.set(result: value)
                    break
                case .Failure(let error):
                    task.set(error: error)
                }
        }
        return task.task;
    }
}
