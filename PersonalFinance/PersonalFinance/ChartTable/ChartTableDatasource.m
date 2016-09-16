//
//  ChartTableDatasource.m
//  PersonalFinance
//
//  Created by Irfan on 9/15/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "ChartTableDatasource.h"
#import "ChartTableViewCell.h"

@implementation ChartTableDatasource

-(instancetype)initWithDatasource:(NSArray<PieChartData *> *)datasource {
    self = [super init];
    _datasource = datasource;
    return self;
}

-(void)updateDatasource:(NSArray<PieChartData *> *)datasource {
    _datasource = datasource;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datasource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ChartTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"charttablecell" forIndexPath:indexPath];
    [cell configureCell:_datasource[indexPath.row]];
    return cell;
}

@end
