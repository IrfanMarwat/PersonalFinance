//
//  Frequency+CoreDataProperties.h
//  PersonalFinance
//
//  Created by Irfan on 9/13/16.
//  Copyright © 2016 Irfan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Frequency.h"
@class Transaction;

NS_ASSUME_NONNULL_BEGIN

@interface Frequency (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *frequency;
@property (nullable, nonatomic, retain) Transaction *transaction;

@end

NS_ASSUME_NONNULL_END
