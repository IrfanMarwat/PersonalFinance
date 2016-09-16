//
//  DashboardDatasource.m
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "DashboardDatasource.h"
#import "DashBoardCell.h"
#import "PersonalFinance-Swift.h"

@interface DashboardDatasource() {
    id<DashboardStore> _store;
}

@end

@implementation DashboardDatasource

-(id)initWithStore:(id<DashboardStore>)store {
    _store = store;
    return self;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [[_store allIdentifiers] count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    id cellDependency = [[_store allDependencies] objectAtIndex:indexPath.row];
    NSString *identifier = [[_store allIdentifiers] objectAtIndex:indexPath.row];
    
    DashBoardCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    [cell configureCellWithDependency:cellDependency];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    float width = [[UIScreen mainScreen] bounds].size.width - 10;
    NSNumber *height = [[_store allCellHeights] objectAtIndex:indexPath.row];
    return CGSizeMake(width, height.floatValue);
}
@end
