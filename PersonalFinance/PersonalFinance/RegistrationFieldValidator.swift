//
//  RegistrationFieldValidator.swift
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//


class RegistrationFieldValidator:NSObject, FieldValidator {
    var accountNumber: String!
    var accountName: String!
    var privateErrorMessage = ""
    
    init(accountNumber: String, accountName: String) {
        self.accountNumber = accountNumber
        self.accountName = accountName
    }
    
    func validate() -> Bool {
        if accountNumber.characters.count <= 0 {
            privateErrorMessage = "Please fill in Acc-Number"
            return false
        }
        
        if accountName.characters.count <= 0 {
            privateErrorMessage = "Please fill in Account Name"
            return false
        }
        
        return true
    }
    
    internal var errorMessage:String {
        get {
            return privateErrorMessage
        }
    }
}
