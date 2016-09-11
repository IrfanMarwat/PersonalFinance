//
//  Frequency+CoreDataProperties.h
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Frequency.h"

NS_ASSUME_NONNULL_BEGIN

@interface Frequency (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *frequency;
@property (nullable, nonatomic, retain) NSNumber *startDate;
@property (nullable, nonatomic, retain) NSNumber *endDate;
@property (nullable, nonatomic, retain) NSManagedObject *expense;
@property (nullable, nonatomic, retain) NSManagedObject *income;

@end

NS_ASSUME_NONNULL_END
