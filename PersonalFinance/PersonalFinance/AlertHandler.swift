//
//  AlertHandler.swift
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

// The concrete instances of this protocol will be capable of presenting alert of various types like native or custom(Toast) etc's
// Alert is the dependency

@objc protocol AlertHandler {
    func presentAlert(alert: Alert)
}