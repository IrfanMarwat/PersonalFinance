//
//  Expense.h
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Transaction.h"

@class Amount, Frequency;

NS_ASSUME_NONNULL_BEGIN

@interface Expense : Transaction

// Insert code here to declare functionality of your managed object subclass

@end

NS_ASSUME_NONNULL_END

#import "Expense+CoreDataProperties.h"
