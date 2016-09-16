//
//  ListingTableCell.h
//  PersonalFinance
//
//  Created by Irfan on 9/14/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BalanceDetail;

@interface ListingTableCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelIncome;
@property (weak, nonatomic) IBOutlet UILabel *labelTerm;
@property (weak, nonatomic) IBOutlet UILabel *labelExpense;
@property (weak, nonatomic) IBOutlet UILabel *labelSaving;

-(void)configureCell:(BalanceDetail *)balanceDetail;

@end
