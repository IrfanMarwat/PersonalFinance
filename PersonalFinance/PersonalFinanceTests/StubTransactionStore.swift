//
//  StubTransactionStore.swift
//  PersonalFinance
//
//  Created by Irfan on 9/14/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class StubTransactionStore: TransactionStore {
    var transactions = Array<Transaction>()
    @objc internal var allItems: Array<Transaction> {
        get {
            return transactions
        }
    }
    
    @objc func createItem(transaction: Transaction) {
        transactions.append(transaction)
    }
    
    @objc func deleteItem(transaction: Transaction) {
        transactions = transactions.filter() { $0.transactionId != transaction.transactionId }
    }
    
    @objc func rollBack() {
        
    }
}
