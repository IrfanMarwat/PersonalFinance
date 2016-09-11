//
//  DashBoardCell.m
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "DashBoardCell.h"
#import "DasboardCellData.h"

@implementation DashBoardCell

-(void)configureCellWithDependency:(DasboardCellData *)cellData {
    [[[NSException alloc] initWithName:@"Dashboard Cell" reason:@"Must implement this method in sub classes" userInfo:nil] raise];
}

@end
