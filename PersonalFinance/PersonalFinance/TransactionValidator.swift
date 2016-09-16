//
//  TransactionValidator.swift
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class TransactionValidator:NSObject, FieldValidator {
    var amount: String!
    var textDescription: String!
    var startTerm: String!
    var endTerm: String!
    
    var privateErrorMessage = ""
    
    init(amount: String, textDescription: String, startTerm: String, endTerm: String) {
        self.amount = amount
        self.textDescription = textDescription
        self.startTerm = startTerm
        self.endTerm = endTerm
    }
    
    func validate() -> Bool {
        if amount.characters.count <= 0 || textDescription.characters.count <= 0 {
            privateErrorMessage = "Please fill in all the required fields"
            return false
        }
        
        let termValidator = TermInputValidator(startTerm: startTerm, endTerm: endTerm)
        
        if !termValidator.validate() {
            privateErrorMessage = termValidator.errorMessage
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
