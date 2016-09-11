//
//  ExpenseViewController.h
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Transaction;

@interface TransactionViewController : UIViewController

-(void)setTransactionStore:(id)store;
-(void)setTransaction:(Transaction *)transaction;

@end
