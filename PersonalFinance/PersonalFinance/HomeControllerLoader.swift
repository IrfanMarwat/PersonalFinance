//
//  HomeControllerLoader.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import UIKit

class HomeControllerLoader:NSObject, ControllerLoader {
    
//    init() {
//
//    }
    
    @objc func loadController() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        
        let window : UIWindow = UIApplication.sharedApplication().keyWindow!
        window.rootViewController = vc
    }
}
