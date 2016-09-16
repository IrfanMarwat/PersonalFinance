//
//  Constants.swift
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

let incomeStore = IncomeStore(coreDataHandler: CoreDataBasic(entity: "Income", context: ManagedObjectContexter.getManagedObjectContext()))

let expenseStore = ExpenseStore(coreDataHandler: CoreDataBasic(entity: "Expense", context: ManagedObjectContexter.getManagedObjectContext()))

let incomeCalculator = TransactionCalculator(transactionStore:incomeStore)

let expenseCalculator = TransactionCalculator(transactionStore: expenseStore)

let numberCharacterSet = NSMutableCharacterSet.decimalDigitCharacterSet()

let alphabetCharacterSet : NSCharacterSet = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")

let specialSymbolsCharacterSet : NSCharacterSet = NSCharacterSet(charactersInString: "!~`@#$%^&*+();:=_{}[],.<>?\\/|\"\'")

func getAmounFieldSet() -> NSCharacterSet {
    let amountFieldCharacter = numberCharacterSet
    amountFieldCharacter.formUnionWithCharacterSet(NSCharacterSet(charactersInString: "."))
    
    return amountFieldCharacter
}
