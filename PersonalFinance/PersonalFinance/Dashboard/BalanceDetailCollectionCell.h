//
//  BalanceDetailCollectionCell.h
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashBoardCell.h"
@class NumberTextField;

@interface BalanceDetailCollectionCell : DashBoardCell
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *labelSavingYearPerYear;
@property (weak, nonatomic) IBOutlet NumberTextField *textFieldStartTerm;
@property (weak, nonatomic) IBOutlet NumberTextField *textFieldEndTerm;

@end
