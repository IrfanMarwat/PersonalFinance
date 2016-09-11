//
//  DashboardViewController.h
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DashboardViewController : UIViewController

-(void)setHomeTreeDelegate:(id)homeTreeDelegate;
-(void)setTransactionPresenter:(id)controllerPresenter;
-(void)setTreeFactory:(id)treeFactory;

@end
