//
//  TransactionDetail.h
//  PersonalFinance
//
//  Created by Irfan on 9/13/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TransactionDetail : NSObject

// per term

@property(nonatomic, assign) NSUInteger term;
@property(nonatomic, assign) double totalAmount; // Per term

@end
