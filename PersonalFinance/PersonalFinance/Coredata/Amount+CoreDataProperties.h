//
//  Amount+CoreDataProperties.h
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Amount.h"

NS_ASSUME_NONNULL_BEGIN

@interface Amount (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *amount;
@property (nullable, nonatomic, retain) NSManagedObject *expense;
@property (nullable, nonatomic, retain) NSManagedObject *income;

@end

NS_ASSUME_NONNULL_END
