//
//  Alert.swift
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

// Concrete instance of this protocol will build a message for presenting

@objc protocol Alert {
    var message: String {get}
}

class ErrorAlert:NSObject, Alert {
    var privateMessage: String = ""
    
    init(message: String) {
        privateMessage = message
    }
    
    @objc internal var message: String {
        get {
            return privateMessage
        }
    }
}