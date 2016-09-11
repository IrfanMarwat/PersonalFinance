//
//  Account+CoreDataProperties.h
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Account.h"

NS_ASSUME_NONNULL_BEGIN

@interface Account (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSString *number;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *transaction;

@end

@interface Account (CoreDataGeneratedAccessors)

- (void)addTransactionObject:(NSManagedObject *)value;
- (void)removeTransactionObject:(NSManagedObject *)value;
- (void)addTransaction:(NSSet<NSManagedObject *> *)values;
- (void)removeTransaction:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
