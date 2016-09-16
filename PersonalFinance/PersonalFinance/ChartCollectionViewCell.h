//
//  ChartCollectionViewCell.h
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DashBoardCell.h"
@class NumberTextField;
@class XYPieChart;

@interface ChartCollectionViewCell : DashBoardCell
@property (weak, nonatomic) IBOutlet NumberTextField *textFieldStartTerm;
@property (weak, nonatomic) IBOutlet NumberTextField *textFieldEndTerm;
@property (weak, nonatomic) IBOutlet XYPieChart *pieChart;
@property (weak, nonatomic) IBOutlet UILabel *textFieldNetIncome;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *labelPercentage;

@end
