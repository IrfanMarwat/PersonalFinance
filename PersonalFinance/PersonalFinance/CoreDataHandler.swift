//
//  CoreDataHandler.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import Foundation
import CoreData

@objc protocol CoreDataHandler {
    func createItem()
    func deleteItem(item: NSManagedObject)
    func fetchItems() -> Array<AnyObject>
    func saveContext()
}

class CoreDataBasic:  CoreDataHandler {
    var entityName: String! // dependency Injection --> Must be injected through constructor
    var context: NSManagedObjectContext! // dependency Injection --> Must be injected through constructo
    
    init(entity: String, context: NSManagedObjectContext) {
        self.entityName = entity
        self.context = context
    }
    
    @objc func createItem() {
        saveContext()
    }
    
    @objc func deleteItem(item : NSManagedObject) {
        ManagedObjectContexter.getManagedObjectContext().deleteObject(item)
        saveContext()
    }
    
    @objc func fetchItems() -> Array<AnyObject> {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        do {
            return try ManagedObjectContexter.getManagedObjectContext().executeFetchRequest(fetchRequest)
        } catch let error as NSError {
            print(error.userInfo)
        }
        
        return Array()
    }
    
    @objc func saveContext() {
        do {
            try
                ManagedObjectContexter.getManagedObjectContext().save()
        } catch let error as NSError {
            print(error.userInfo)
        }
    }
}
