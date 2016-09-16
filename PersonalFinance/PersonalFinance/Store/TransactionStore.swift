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
    func deleteItem(transaction: Transaction)
    func rollBack()
}

class IncomeStore:NSObject, TransactionStore {
    var privateItems = CoreDataBasic(entity: "Income", context: ManagedObjectContexter.getManagedObjectContext()).fetchItems()
    var coreDataHandler: CoreDataHandler? = nil //Property Injection should be injected by external source!

    init(coreDataHandler: CoreDataHandler) {
        self.coreDataHandler = coreDataHandler // Constructor Injection
    }
    
    @objc func createItem(transaction: Transaction) {
        privateItems.append(transaction)
        coreDataHandler?.createItem()
    }
    
    @objc func deleteItem(transaction: Transaction) {
        privateItems = privateItems.filter() { $0.transactionId != transaction.transactionId }
        coreDataHandler?.deleteItem(transaction)
    }
    
    @objc internal var allItems: Array<Transaction> {
        get {
            return CoreDataBasic(entity: "Income", context: ManagedObjectContexter.getManagedObjectContext()).fetchItems() as! Array<Transaction>
        }
    }
    
    func rollBack() {
        coreDataHandler?.rollBack()
    }
}

class ExpenseStore:NSObject, TransactionStore {
    var privateItems = CoreDataBasic(entity: "Expense", context: ManagedObjectContexter.getManagedObjectContext()).fetchItems()
    var coreDataHandler: CoreDataHandler? = nil //Property Injection should be injected by external source!
    
    init(coreDataHandler: CoreDataHandler) {
        self.coreDataHandler = coreDataHandler // Constructor Injection
    }
    
    @objc func createItem(transaction: Transaction) {
        privateItems.append(transaction)
        coreDataHandler?.createItem()
    }
    
    @objc func deleteItem(transaction: Transaction) {
        privateItems = privateItems.filter() { $0.transactionId != transaction.transactionId }
    }
    
    @objc internal var allItems: Array<Transaction> {
        get {
            return CoreDataBasic(entity: "Expense", context: ManagedObjectContexter.getManagedObjectContext()).fetchItems() as! Array<Expense>
        }
    }
    
    func rollBack() {
        coreDataHandler?.rollBack()
    }
}