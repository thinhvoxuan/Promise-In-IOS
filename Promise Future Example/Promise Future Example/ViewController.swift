//
//  ViewController.swift
//  Promise Future Example
//
//  Created by thinhvoxuan on 7/29/16.
//  Copyright © 2016 GEEKUp Company. All rights reserved.
//

import UIKit
import BoltsSwift

class ViewController: UIViewController {

    let networking = Networking.sharedInstance
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
//        self.fetchFirstTime()
        self.fetchFirstTimeWithError()
    }
    
    //Task.whenAllResult(
    //Task.whenAll(
    
    func fetchFirstTime() {
        Task.whenAllResult(
            networking.fetchAppVersionBF(),
            networking.fetchConfigBF(),
            networking.fetchProfileBF()
            ).continueWith { task in
                if task.cancelled {
                    // Save was cancelled
                    print("canceleed: \(task.error.debugDescription)")
                } else if task.faulted {
                    // Save failed
                    print("faulted: \(task.error.debugDescription)")
                } else {
                    // Object was successfully saved
                    let result = task.result
                    print("result: \(result)")
                }
        }
    }
    
    //Task.whenAllResult(
    
    func fetchFirstTimeWithError(){
        Task.whenAll(
            networking.fetchConfigBFMustFailed(),
            networking.fetchAppVersionBF(),
            networking.fetchProfileBF()
            ).continueWith { task in
                if task.cancelled {
                    // Save was cancelled
                    print("canceleed: \(task.error.debugDescription)")
                } else if task.faulted {
                    // Save failed
                    print("faulted: \(task.error.debugDescription)")
                } else {
                    // Object was successfully saved
                    let result = task.result
                    print("result: \(result)")
                }
        }
    }
    
}

