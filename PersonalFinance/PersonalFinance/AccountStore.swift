//
//  AccountStore.swift
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import Foundation

@objc protocol AccountStore {
    var allItems: Array<Account>{get}
    func createAccount(account: Account)
}

class FinancedAccountStore:NSObject, AccountStore {
    var _coreDataHandler: CoreDataHandler? = nil
    
    init(coreDataHandler: CoreDataHandler) {
        _coreDataHandler = coreDataHandler
    }
    
    @objc func createAccount(account: Account) {
        _coreDataHandler?.createItem()
    }
    
    @objc internal var allItems: [Account] {
        get {
            return _coreDataHandler?.fetchItems() as? [Account] ?? Array()
        }
    }
}