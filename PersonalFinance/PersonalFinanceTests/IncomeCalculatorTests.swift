//
//  IncomeCalculator.swift
//  PersonalFinance
//
//  Created by Irfan on 9/13/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import XCTest

class IncomeCalculatorTests: XCTestCase {
    
    var incomeStore: TransactionStore! // dependency
    var incomeCalculator: TransactionDetailGenerator! // System under test
    
    override func setUp() {
        super.setUp()
        
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
        
        incomeCalculator = TransactionCalculator(transactionStore: incomeStore!)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        ManagedObjectContexter.getManagedObjectContext().rollback()
        super.tearDown()
    }
    
    class FackManagedObjectContext {
        class func getManagedObjectContext() -> NSManagedObjectContext {
            return NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.PrivateQueueConcurrencyType)
        }
    }
    
    func testIfIncomeStoreIsNotNil() {
        XCTAssertNotNil(incomeStore, "IncomeStore cannot be nil")
    }
    
    func testIfIncomeCalculatorIsNotNil() {
        XCTAssertNotNil(incomeCalculator, "IncomeCalculator cannot be nil")
    }
    
    func testCalculateIncomePerTerm() {
        let term = 7
        
        let result = incomeCalculator?.getTransactionDetailPerTerm(term)
        XCTAssertTrue(result!.totalAmount == 80)
        
        let testterm = 8
        
        let testresult = incomeCalculator?.getTransactionDetailPerTerm(testterm)
        XCTAssertTrue(testresult!.totalAmount == 40, "testing")

    }
    
    func testCalculateIncomeForTweleveTerms() {
        let startTerm = 1
        
        let result = incomeCalculator?.getTransactionDetailForTweleveTerms(startTerm)
        XCTAssertEqual(result?.count, 12, "Calculation for twelve months")
    }
    
    func testCalculateIncomeBetweenTerms() {
        let startTerm = 1
        let endTerm = 10
        
        let result = incomeCalculator?.getTransactionDetailBetweenTerms(startTerm, endTerm: endTerm)
        
        print(result)
        
        let firstObject = result!.first
        let secondObject = result![1]
        let seventhObject = result![6]
        let lastObject = result!.last
        
        XCTAssertEqual(firstObject!.totalAmount, 10, "First Term Income")
        XCTAssertEqual(secondObject.totalAmount, 30, "Second Term Income")
        XCTAssertEqual(lastObject!.totalAmount, 40, "Last Term Income")
        XCTAssertEqual(seventhObject.totalAmount, 80, "Seventh Term Income")
        
        var total = 0.0
        
        for item in result! {
            let tempItem = item
            total = total + tempItem.totalAmount
        }
        
        XCTAssertEqual(total, 360, "Annual Income")
        XCTAssertEqual(result?.count, 10, "Listing between Terms")
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
