//
//  DashboardViewController.h
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DashboardFunctionalityProvider <NSObject>

-(void)loadIncome;
-(void)loadExpense;

@end

@interface DashboardViewController : UIViewController

-(void)setHomeTreeDelegate:(id)homeTreeDelegate;
-(void)setTransactionPresenter:(id)controllerPresenter;
-(void)setTreeFactory:(id)treeFactory;
-(void)setStore:(id)store;

@end
