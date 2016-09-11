//
//  DashboardViewController.m
//  PersonalFinance
//
//  Created by Irfan on 9/10/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

#import "DashboardViewController.h"
#import "Income.h"
#import "Expense.h"
#import "PersonalFinance-Swift.h"

@protocol DashboardFunctionalityProvider <NSObject>

-(void)loadIncome;
-(void)loadExpense;

@end

@interface DashboardViewController ()<TreeButtonsProtocol, DashboardFunctionalityProvider, ControllerPresentable> {
    id<ControllerPresenter> _transactionPresenter;
    id<TreeFactory> _treefactory;
    id<HomeTreeHandling> _homeTreeDelegate;
}

@end

@implementation DashboardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _treefactory = [[TransactionTreeFactory alloc] initWithDelegate:self]; // Should have injected the external source ?? Voilation ??
    [_homeTreeDelegate setupTreeHandler:_treefactory];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setTreeFactory:(id)treeFactory {
    _treefactory = treeFactory;
}

-(void)setHomeTreeDelegate:(id)homeTreeDelegate {
    _homeTreeDelegate = homeTreeDelegate;
}

-(void)setTransactionPresenter:(id)controllerPresenter {
    _transactionPresenter = controllerPresenter;
}

-(void)nodeSelected:(ParentTreeButton *)sender {
    [_homeTreeDelegate collapseTree];
    [self loadIncome];
    
}

-(UIViewController *)getViewController {
    return self;
}

-(void)loadIncome {
    id<TransactionStore> store = [[[IncomeStoreFactory alloc] init] getObject];
    Transaction *transaction = [[Income alloc] initWithContext:[ManagedObjectContexter getManagedObjectContext]];
    
    _transactionPresenter = [[TransactionPresenter alloc] initWithStore:store controllerPresentable:self transaction:transaction];
    
    [_transactionPresenter presentController];
    
}

-(void)loadExpense {
    id<TransactionStore> store = [[[ExpenseStoreFactory alloc] init] getObject];
    Transaction *transaction = [[Expense alloc] initWithContext:[ManagedObjectContexter getManagedObjectContext]];
    
    _transactionPresenter = [[TransactionPresenter alloc] initWithStore:store controllerPresentable:self transaction:transaction];
    
    [_transactionPresenter presentController];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
