//
//  Income+CoreDataProperties.h
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Income.h"

NS_ASSUME_NONNULL_BEGIN

@interface Income (CoreDataProperties)

@property (nullable, nonatomic, retain) Amount *amount;
@property (nullable, nonatomic, retain) Frequency *frequency;

@end

NS_ASSUME_NONNULL_END
