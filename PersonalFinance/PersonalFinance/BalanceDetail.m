//
//  BalanceDetail.m
//  PersonalFinance
//
//  Created by Irfan on 9/13/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "BalanceDetail.h"

@interface BalanceDetail () {
    double privateTerm;
    double privateTotalIncome;
    double privateTotalExpense;
    double privateSaving;
}

@end

@implementation BalanceDetail

-(instancetype)initWithTerm:(NSNumber *)term totalIncome:(NSNumber *)income totalExpense:(NSNumber *)expense saving:(NSNumber *)savingAmount {
    
    self = [super init];
    
    privateTerm = [term doubleValue];
    privateTotalIncome = [income doubleValue];
    privateTotalExpense = [expense doubleValue];
    privateSaving =  [savingAmount doubleValue];
    
    return self;
}

-(double)saving {
    return privateSaving;
}

-(double)totalExpense {
    return privateTotalExpense;
}

-(double)totalIncome {
    return privateTotalIncome;
}

-(NSUInteger)term {
    return privateTerm;
}

@end
