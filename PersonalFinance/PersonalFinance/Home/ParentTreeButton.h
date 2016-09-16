//
//  TreeButton.h
//  PersonalFinance
//
//  Created by Irfan on 9/11/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TreeButtonsProtocol;

@interface ParentTreeButton : UIButton

@property (nonatomic, strong) NSString *btnTitle;
@property (nonatomic, weak) id<TreeButtonsProtocol> delegate; // dependency
@property (nonatomic, strong) NSArray<ParentTreeButton *> *children; // dependency
@property (nonatomic) BOOL isExpanded;

@property (nonatomic) CGFloat delay;

- (void)collapseChildren;
- (void)expandChildren;
- (CGFloat)delay;
- (void)btnPressed;

@end

@protocol TreeButtonDatasource<NSObject>
-(void)setChildern:(NSArray<ParentTreeButton *> *)childern; // datasource
@end

@protocol TreeButtonsProtocol <NSObject> // delegates

- (void)nodeSelected:(ParentTreeButton *)sender;

@end