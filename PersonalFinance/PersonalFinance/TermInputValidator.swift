//
//  TermInputValidator.swift
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class TermInputValidator:NSObject, FieldValidator {
    var startTerm: String!
    var endTerm: String!
    var privateErrorMessage = ""
    
    init(startTerm: String, endTerm: String) {
        self.startTerm = startTerm
        self.endTerm = endTerm
    }
    
    func validate() -> Bool {
        
        if startTerm.characters.count <= 0 {
            privateErrorMessage = "Please fill start term"
            return false
        }
        
        if endTerm.characters.count <= 0 {
            privateErrorMessage = "Please fill end term"
            return false
        }
        
        if Int(startTerm) > Int(endTerm) {
            privateErrorMessage = "End term cannot be less then start term"
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
