//
//  Transaction+CoreDataProperties.m
//  PersonalFinance
//
//  Created by Irfan on 9/13/16.
//  Copyright © 2016 Irfan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Transaction+CoreDataProperties.h"

@implementation Transaction (CoreDataProperties)

@dynamic transactionId;
@dynamic startTerm;
@dynamic endTerm;
@dynamic amount;
@dynamic account;
@dynamic frequency;
@dynamic name;

@end
