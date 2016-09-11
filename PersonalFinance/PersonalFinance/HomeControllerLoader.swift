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
    
    init(dashboardLoader: ControllerLoader, treeHandler: TreeHandler) {
        self.dashbaordLoader = dashboardLoader
        self.treeHandler = treeHandler
    }
    
    @objc func loadController() {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("HomeViewController") as! HomeViewController
        
        vc.setDashboardLoader(dashbaordLoader)
        vc.setTreeHandler(treeHandler)
        
        let window : UIWindow = UIApplication.sharedApplication().keyWindow!
        
        window.rootViewController?.presentViewController(vc, animated: true, completion: nil)
//        window.rootViewController = vc
    }
}
