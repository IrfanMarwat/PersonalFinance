//
//  AccountDetailHandler.swift
//  PersonalFinance
//
//  Created by Irfan on 9/14/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

class AccountDetailHandler: NSObject {
    // SRP
    var incomeCalculator: TransactionDetailGenerator! // dependency  --> Constructor Injection
    var expenseCalculator: TransactionDetailGenerator! // dependency  --> Constructor Injection

    var incomeDetails = [TransactionDetail]() // Term by term
    var expenseDetails = [TransactionDetail]() // Term by term
    
    init(incomeCalculator: TransactionDetailGenerator, expenseCalculator: TransactionDetailGenerator) {
        self.incomeCalculator = incomeCalculator
        self.expenseCalculator = expenseCalculator
    }
    
    func totalTransactionFor(startTerm: Int, endTerm: Int) -> Double {
        incomeDetails = getAllIncomDetails(startTerm, endTerm: endTerm)
        expenseDetails = getAllExpenseDetails(startTerm, endTerm: endTerm)
        
        var totalTransaction = 0.0
        
        for(index, _) in incomeDetails.enumerate() {
            let incomeDetail = incomeDetails[index]
            let expenseDetail = expenseDetails[index]
            
            totalTransaction = totalTransaction + (incomeDetail.totalAmount + expenseDetail.totalAmount)
        }
        
        return totalTransaction
    }
    
    func getTotalSavingFor(startTerm: Int, endTerm: Int) -> Double {
        var balanceDetails = [BalanceDetail]()
        balanceDetails = getAccountDetailFor(startTerm, endTerm: endTerm)
        var totalSaving = 0.0
        
        for balanceDetailObj in balanceDetails {
            totalSaving = totalSaving + balanceDetailObj.saving
        }
        
        return totalSaving
    }
    
    func getAccountDetailFor(startTerm: Int, endTerm: Int) -> [BalanceDetail] {
        var balanceDetails = [BalanceDetail]()

        incomeDetails = getAllIncomDetails(startTerm, endTerm: endTerm)
        expenseDetails = getAllExpenseDetails(startTerm, endTerm: endTerm)
        
        incomeDetails.sortInPlace() {$0.term < $1.term}
        expenseDetails.sortInPlace() {$0.term < $1.term}
        
        //coupling ?? Category 1 Rule voilation
        
        for(index, _) in incomeDetails.enumerate() {
            let incomeDetail = incomeDetails[index]
            let expenseDetail = expenseDetails[index]
            
            let saving = incomeDetail.totalAmount - expenseDetail.totalAmount
            
            let balanceDetail = BalanceDetail(term: incomeDetail.term, totalIncome:incomeDetail.totalAmount, totalExpense: expenseDetail.totalAmount, saving:saving)
            
            balanceDetails.append(balanceDetail)
        }
        
        return balanceDetails
    }
    
    private func getAllIncomDetails(startTerm: Int, endTerm: Int) -> [TransactionDetail] {
        return incomeCalculator.getTransactionDetailBetweenTerms(startTerm, endTerm: endTerm)
    }
    
    private func getAllExpenseDetails(startTerm: Int, endTerm: Int) -> [TransactionDetail] {
        return expenseCalculator.getTransactionDetailBetweenTerms(startTerm, endTerm: endTerm)
    }
}
