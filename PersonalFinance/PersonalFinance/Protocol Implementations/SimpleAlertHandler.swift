//
//  SimpleAlertHandler.swift
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import UIKit

class SimpleAlertHandler: AlertHandler {
    var _viewController: UIViewController? = nil // Dependency -- Constructor Injection
    
    init(viewController: UIViewController) {
        _viewController = viewController
    }
    
    func presentAlert(alert: Alert) {
        let alertController = UIAlertController(title: "Alert", message: alert.message, preferredStyle:.Alert)
        let alertActionOK = UIAlertAction(title: "OK", style: .Cancel) { action -> Void in
            
        }
        alertController.addAction(alertActionOK)
        _viewController!.presentViewController(alertController, animated: true, completion: nil)
    }
}
