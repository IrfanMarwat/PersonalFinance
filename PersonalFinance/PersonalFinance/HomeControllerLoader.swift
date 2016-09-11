//
//  HomeControllerLoader.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import UIKit

class HomeControllerLoader:NSObject, ControllerLoader {
    var dashbaordLoader: ControllerLoader? = nil
    var treeHandler: TreeHandler? = nil
    
    @objc func loadController() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        dashbaordLoader = DashbaordLoader(delegateToHome:vc as? HomeControllerLoading)
        vc.setDashboardLoader(dashbaordLoader)
        
        let window : UIWindow = UIApplication.sharedApplication().keyWindow!
        
        window.rootViewController?.presentViewController(vc, animated: true, completion: nil)
//        window.rootViewController = vc
    }
}
