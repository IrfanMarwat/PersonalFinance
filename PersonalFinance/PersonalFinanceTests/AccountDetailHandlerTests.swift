//
//  AccountDetailHandlerTests.swift
//  PersonalFinance
//
//  Created by Irfan on 9/14/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import XCTest

class AccountDetailHandlerTests: XCTestCase {
    
    var accountDetailHandler: AccountDetailHandler! // System Under Test
    
    var incomeCalculator: TransactionDetailGenerator! // SUT dependency
    var expenseCalculator: TransactionDetailGenerator! // SUT dependency
    
    var incomeStore: TransactionStore! // calculator dependency
    var expenseStore: TransactionStore! // calulator dependency
    
    override func setUp() {
        super.setUp()
        
        setUpIncomeStore()
        setUpExpenseStore()
        
        incomeCalculator = TransactionCalculator(transactionStore: incomeStore)
        expenseCalculator = TransactionCalculator(transactionStore: expenseStore)
        
        accountDetailHandler = AccountDetailHandler(incomeCalculator: incomeCalculator, expenseCalculator: expenseCalculator)
    }
    
    func setUpIncomeStore() {
        incomeStore = StubTransactionStore() // Fake store
        
        let income = Income(context: ManagedObjectContexter.getManagedObjectContext())
        income.amount = 10
        income.startTerm = 1 // starting from today
        income.endTerm = 12
        
        incomeStore?.createItem(income)
        
        let income2 = Income(context: ManagedObjectContexter.getManagedObjectContext())
        income2.amount = 20
        income2.startTerm = 2 // starting from next month(term)
        income2.endTerm = 12
        
        incomeStore?.createItem(income2)
        
        let income3 = Income(context: ManagedObjectContexter.getManagedObjectContext())
        income3.amount = 10
        income3.startTerm = 8 // starting from 8th month(term)
        income3.endTerm = 12
        
        incomeStore?.createItem(income3)
        
        let income4 = Income(context: ManagedObjectContexter.getManagedObjectContext()) // Non Recurring --> Only for single term
        income4.amount = 50
        income4.startTerm = 7
        income4.endTerm = 7
        
        incomeStore.createItem(income4)
    }
    
    func setUpExpenseStore() {
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
    }
    
    func testIfDependenciesAreNotNil() {
        XCTAssertNotNil(accountDetailHandler.incomeCalculator, "Dependencies are not provided correctly")
        XCTAssertNotNil(accountDetailHandler.expenseCalculator, "Dependencies are not provided correctly")
    }
    
    func testAccountDetailForTwelveTerms() {
        let startTerm = 1
        let endTerm = 12
        
        let result = accountDetailHandler.getAccountDetailFor(startTerm, endTerm: endTerm)
        let ninthTermSaving = result[9].saving
        XCTAssertEqual(result.count, 12, "Twelve terms detail")
        XCTAssertEqual(result.first?.saving, 0, "Balance should be zero, If Income and Expense are equal")
        XCTAssertEqual(ninthTermSaving, 10, "Balance become 10 if Income per term is 30 and expense per term is 20")
    }
    
    func testSavingForTwelveTerms() {
        let startTerm = 1
        let endTerm = 12
        
        let result = accountDetailHandler.getTotalSavingFor(startTerm, endTerm: endTerm)
        XCTAssertEqual(result, 160, "Saving for twelve terms")
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
