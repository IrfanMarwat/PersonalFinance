//
//  ChartTableDatasource.h
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class PieChartData;

@interface ChartTableDatasource : NSObject<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong, readonly) NSArray<PieChartData *>*datasource;
-(instancetype)initWithDatasource:(NSArray<PieChartData *> *)datasource;
-(void)updateDatasource:(NSArray<PieChartData *> *)datasource;

@end
