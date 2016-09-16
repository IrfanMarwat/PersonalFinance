//
//  ChartTableViewCell.h
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PieChartData;

@interface ChartTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *labelDot;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelPercentage;

-(void)configureCell:(PieChartData *)cellData;

@end
