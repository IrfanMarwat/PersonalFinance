//
//  Income.h
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transaction.h"

@class Amount, Frequency;

NS_ASSUME_NONNULL_BEGIN

@interface Income : Transaction

// Insert code here to declare functionality of your managed object subclass
-(instancetype)initWithContext:(NSManagedObjectContext *)context;

@end

NS_ASSUME_NONNULL_END

#import "Income+CoreDataProperties.h"
