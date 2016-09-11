//
//  ManagedObjectContexter.swift
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import UIKit
import CoreData

class ManagedObjectContexter: NSObject {
    class func getManagedObjectContext() -> NSManagedObjectContext {
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        return managedContext
    }
}