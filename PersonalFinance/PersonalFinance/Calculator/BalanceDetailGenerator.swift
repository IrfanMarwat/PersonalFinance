//
//  BalanceDetailGenerator.swift
//  PersonalFinance
//
//  Created by Irfan on 9/13/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

@objc protocol TransactionDetailGenerator {
    func getTransactionDetailPerTerm(term: Int) -> TransactionDetail
    func getTransactionDetailForTweleveTerms(startTerm: Int) -> [TransactionDetail]
    func getTransactionDetailBetweenTerms(startTerm: Int, endTerm: Int) -> [TransactionDetail]
}