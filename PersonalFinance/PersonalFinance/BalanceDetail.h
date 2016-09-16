//
//  BalanceDetail.h
//  PersonalFinance
//
//  Created by Irfan on 9/13/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BalanceDetail : NSObject

// Per term Detail

@property(nonatomic, assign, readonly) NSUInteger term;

@property(nonatomic, assign, readonly) double totalIncome; // per term
@property(nonatomic, assign, readonly) double totalExpense; // per term
@property(nonatomic, assign, readonly) double saving; // per term

-(instancetype)initWithTerm:(NSNumber *)term totalIncome:(NSNumber *)income totalExpense:(NSNumber *)expense saving:(NSNumber *)savingAmount;

@end
