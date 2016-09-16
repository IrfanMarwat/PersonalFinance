//
//  TableViewDatasource.m
//  PersonalFinance
//
//  Created by Irfan on 9/14/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "TableViewDatasource.h"
#import "ListingTableCell.h"
#import "BalanceDetail.h"

@interface TableViewDatasource() {
    NSArray<BalanceDetail *> *_datasource;
    double _saving;
}

@end

@implementation TableViewDatasource

-(instancetype)initWithListing:(NSArray<BalanceDetail *> *)datasource {
    
    self = [super init];
    
    _datasource = datasource;
    return self;
}

-(void)updateDatasource:(NSArray<BalanceDetail *> *)datasource {
    _datasource = datasource;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _datasource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListingTableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listingtablecell" forIndexPath:indexPath];
    BalanceDetail *balanceDetail = _datasource[indexPath.row];
    
    [cell configureCell:balanceDetail];
    
    return cell;
}

@end
