//
//  ListingTableCell.m
//  PersonalFinance
//
//  Created by Irfan on 9/14/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "ListingTableCell.h"
#import "BalanceDetail.h"

@implementation ListingTableCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configureCell:(BalanceDetail *)balanceDetail {
    self.labelTerm.text = [NSString stringWithFormat:@"%lu", balanceDetail.term];
    self.labelIncome.text = [NSString stringWithFormat:@"%0.1f", balanceDetail.totalIncome];
    self.labelExpense.text = [NSString stringWithFormat:@"%0.1f", balanceDetail.totalExpense];
    self.labelSaving.text = [NSString stringWithFormat:@"%0.1f", balanceDetail.saving];
}

@end
