//
//  DashBoardCell.h
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DashboardCellData;

@interface DashBoardCell : UICollectionViewCell

-(void)configureCellWithDependency:(DashboardCellData *)cellData;

@end
