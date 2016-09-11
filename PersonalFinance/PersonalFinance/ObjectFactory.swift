//
//  ObjectFactory.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import Foundation

@objc protocol ObjectFacotory {
    func getObject() -> AnyObject
}

class AccountStoreFactory:NSObject, ObjectFacotory {
    @objc func getObject() -> AnyObject {
        let coreDataHandler = CoreDataHandlerFactory(entityName: "Account", context: ManagedObjectContexter.getManagedObjectContext()).getObject() as! CoreDataHandler
        return FinancedAccountStore(coreDataHandler: coreDataHandler)
    }
}

class AccountFactory: ObjectFacotory {
    @objc func getObject() -> AnyObject {
        return Account(context: ManagedObjectContexter.getManagedObjectContext())
    }
}

class CoreDataHandlerFactory: ObjectFacotory {
    
    var entityName: String!
    var context: NSManagedObjectContext!
    
    init(entityName: String, context: NSManagedObjectContext) {
        self.entityName = entityName
        self.context = context
    }
    
    @objc func getObject() -> AnyObject {
        return CoreDataBasic(entity: entityName, context: context)
    }
}

class IncomeStoreFactory:NSObject, ObjectFacotory {
    
    @objc func getObject() -> AnyObject {
        let coreDataHandler = CoreDataHandlerFactory(entityName: "Income", context: ManagedObjectContexter.getManagedObjectContext()).getObject() as! CoreDataHandler
        return IncomeStore(coreDataHandler: coreDataHandler)
    }
}

class ExpenseStoreFactory:NSObject, ObjectFacotory {
    
    @objc func getObject() -> AnyObject {
        let coreDataHandler = CoreDataHandlerFactory(entityName: "Expense", context: ManagedObjectContexter.getManagedObjectContext()).getObject() as! CoreDataHandler
        return IncomeStore(coreDataHandler: coreDataHandler)
    }
}