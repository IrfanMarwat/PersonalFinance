//
//  TransactionStore.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

// Reason for using swift files for Stores is because I want imutable stores, thats why swift array is used instead nsarray, Secondly dependency can be injected easily

@objc protocol TransactionStore {
    var allItems: Array<Transaction> {get}
    func createItem(transaction: Transaction)
    func deleteTransaction(transaction: Transaction)
}

class IncomeStore: TransactionStore {
    var privateItems = Array<Transaction>()
    var coreDataHandler: CoreDataHandler? = nil //Property Injection should be injected by external source!

    init(coreDataHandler: CoreDataHandler) {
        self.coreDataHandler = coreDataHandler // Constructor Injection
    }
    
    @objc func createItem(transaction: Transaction) {
        privateItems.append(transaction)
    }
    
    @objc func deleteTransaction(transaction: Transaction) {
        privateItems = privateItems.filter() { $0.transactionId != transaction.transactionId }
    }
    
    @objc internal var allItems: Array<Transaction> {
        get {
            return privateItems
        }
    }
}

class ExpenseStore: TransactionStore {
    var privateItems = Array<Transaction>()
    
    @objc func createItem(transaction: Transaction) {
        privateItems.append(transaction)
    }
    
    @objc func deleteTransaction(transaction: Transaction) {
        privateItems = privateItems.filter() { $0.transactionId != transaction.transactionId }
    }
    
    @objc internal var allItems: Array<Transaction> {
        get {
            return privateItems
        }
    }
}