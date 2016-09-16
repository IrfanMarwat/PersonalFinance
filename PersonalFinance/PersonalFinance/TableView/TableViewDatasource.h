//
//  TableViewDatasource.h
//  PersonalFinance
//
//  Created by Irfan on 9/14/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class BalanceDetail;

@interface TableViewDatasource : NSObject<UITableViewDataSource, UITableViewDelegate>

-(instancetype)initWithListing:(NSArray<BalanceDetail *> *)datasource;
-(void)updateDatasource:(NSArray<BalanceDetail *> *)datasource;

@end
