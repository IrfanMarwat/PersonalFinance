//
//  IncomeCalculator.swift
//  PersonalFinance
//
//  Created by Irfan on 9/13/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class TransactionCalculator: TransactionDetailGenerator {
    
    var transactionStore: TransactionStore!
    
    init(transactionStore: TransactionStore) {
        self.transactionStore = transactionStore
    }
    
    @objc func getTransactionDetailPerTerm(term: Int) -> TransactionDetail {
        return getTransactionDetailBetweenTerms(term, endTerm: term).first!
    }
    
    @objc func getTransactionDetailForTweleveTerms(startTerm: Int) -> [TransactionDetail] {
        return getTransactionDetailBetweenTerms(startTerm, endTerm: startTerm + 11)
    }
    
    @objc func getTransactionDetailBetweenTerms(startTerm: Int, endTerm: Int) -> [TransactionDetail] {
        var allIncomeDetails = [TransactionDetail]()
            
        for i in Range(start: startTerm, end: endTerm+1) {
            let incomeDetail = getTransactionDetailFromEffectiveIncomes(i)
            allIncomeDetails.append(incomeDetail)
        }
        
        return allIncomeDetails
    }
    
    private func getTransactionDetailFromEffectiveIncomes(term: Int) -> TransactionDetail {
        let transactionDetail = TransactionDetail()
        transactionDetail.term = UInt(term)
        
        for transactionObj in transactionStore.allItems {
            if transactionObj.startTerm?.integerValue <= term && transactionObj.endTerm?.integerValue >= term {
                let amount = transactionObj.amount?.doubleValue ?? 0
                transactionDetail.totalAmount = transactionDetail.totalAmount + amount
            }
        }
        return transactionDetail
    }
}
