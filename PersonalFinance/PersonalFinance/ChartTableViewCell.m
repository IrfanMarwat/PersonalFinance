//
//  ChartTableViewCell.m
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "ChartTableViewCell.h"
#import "PersonalFinance-Swift.h"

@implementation ChartTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)configureCell:(PieChartData *)cellData {
    _labelDot.backgroundColor = cellData.color;
    _labelName.text = cellData.name;
    _labelPercentage.text = [NSString stringWithFormat:@"%lu", cellData.value.integerValue];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
