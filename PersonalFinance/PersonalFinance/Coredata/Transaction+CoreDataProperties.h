//
//  Transaction+CoreDataProperties.h
//  PersonalFinance
//
//  Created by Irfan on 9/13/16.
//  Copyright © 2016 Irfan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Transaction.h"
@class Frequency;

NS_ASSUME_NONNULL_BEGIN

@interface Transaction (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *transactionId;
@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *startTerm;
@property (nullable, nonatomic, retain) NSNumber *endTerm;
@property (nullable, nonatomic, retain) NSNumber *amount;
@property (nullable, nonatomic, retain) Account *account;
@property (nullable, nonatomic, retain) Frequency *frequency;

@end

NS_ASSUME_NONNULL_END
