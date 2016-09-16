//
//  ExpenseCalculatorTests.swift
//  PersonalFinance
//
//  Created by Irfan on 9/13/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import XCTest

class ExpenseCalculatorTests: XCTestCase {
    
    var expenseStore: TransactionStore! // dependency
    var expenseCalculator: TransactionDetailGenerator! // System under Test
    
    override func setUp() {
        super.setUp()
        
        expenseStore = StubTransactionStore() // Fake store
        
        let expense = Expense(context: ManagedObjectContexter.getManagedObjectContext())
        expense.amount = 10
        expense.startTerm = 1
        expense.endTerm = 12
        
        expenseStore?.createItem(expense)
        
        let expense2 = Expense(context: ManagedObjectContexter.getManagedObjectContext())
        expense2.amount = 10
        expense2.startTerm = 2
        expense2.endTerm = 12
        
        expenseStore?.createItem(expense2)
        
        let expense3 = Expense(context: ManagedObjectContexter.getManagedObjectContext())
        expense3.amount = 10
        expense3.startTerm = 8
        expense3.endTerm = 12
        
        expenseStore?.createItem(expense3)
        
        expenseCalculator = TransactionCalculator(transactionStore: expenseStore!)
    }
    
    func testIfexpenseStoreIsNotNil() {
        XCTAssertNotNil(expenseStore, "expenseStore cannot be nil")
    }
    
    func testIfexpenseCalculatorIsNotNil() {
        XCTAssertNotNil(expenseCalculator, "expenseCalculator cannot be nil")
    }
    
    func testCalculateIncomePerTerm() {
        let term = 8
        
        let result = expenseCalculator?.getTransactionDetailPerTerm(term)
        XCTAssertTrue(result!.totalAmount == 30)
    }
    
    func testCalculateIncomeForTweleveTerms() {
        let startTerm = 1
        
        let result = expenseCalculator?.getTransactionDetailForTweleveTerms(startTerm)
        XCTAssertEqual(result?.count, 12, "Calculation for twelve months")
    }
    
    func testCalculateIncomeBetweenTerms() {
        let startTerm = 1
        let endTerm = 10
        
        let result = expenseCalculator?.getTransactionDetailBetweenTerms(startTerm, endTerm: endTerm)
        
        let firstObject = result?.first
        let secondObject = result![1]
        let lastObject = result?.last
        
        XCTAssertEqual(firstObject!.totalAmount, 10, "First Term Expense")
        XCTAssertEqual(secondObject.totalAmount, 20, "Second Term Expense")
        XCTAssertEqual(lastObject!.totalAmount, 30, "Last Term Expense")
        
        var total = 0.0
        
        for item in result! {
            let tempItem = item
            total = total + tempItem.totalAmount
        }
        
        XCTAssertEqual(total, 220, "Annual Expense")
        XCTAssertEqual(result?.count, 10, "Listing between Terms")
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        ManagedObjectContexter.getManagedObjectContext().rollback()
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
}
