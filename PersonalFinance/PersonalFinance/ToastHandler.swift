//
//  ToastHandler.swift
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//


class ToastHandler: AlertHandler {
    func presentAlert(alert: Alert) { // Method Injection (Dependency)
        iToast.makeText(alert.message).setDuration(1000).setGravity(iToastGravityCenter).show()
    }
}
