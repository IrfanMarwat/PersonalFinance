//
//  AccountStore.swift
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

@objc protocol AccountStore {
//    var account: Account{get}
    func createAccount()
}

class FinancedAccountStore:NSObject, AccountStore {
//    var account: Account? = nil
    @objc func createAccount() {
        
    }
}